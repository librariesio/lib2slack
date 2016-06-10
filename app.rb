require 'bundler'
require 'json'
Bundler.require

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

class Lib2Issue < Sinatra::Base
  use Rack::Deflater

  configure do
    set :logging, true
    set :dump_errors, false
    set :raise_errors, true
    set :show_exceptions, false
  end

  before do
    request.body.rewind
    @data = JSON.parse request.body.read
  end

  post '/webhook' do
    content_type :json

    create_issue(@data['repository'], @data['platform'], @data['name'], @data['version'], @data['requirements'])

    status 200
    body ''
  end

  def post_to_slack(repository, platform, name, version, requiremnts)
    return if ENV['SKIP_PRERELEASE'] && prerelease?(platform, version)
    return if satisfied_by_requirements?(requiremnts, version)

    client = Slack::Web::Client.new

    client.chat_postMessage(channel: ENV['SLACK_CHANNEL'], text: "Upgrade #{name} to version #{version}",
    "Libraries.io has found that there is a newer version of #{name} that this project depends on.

More info: https://libraries.io/#{platform.downcase}/#{name}/#{version}", as_user: true)
  end

  def satisfied_by_requirements?(requiremnts, version)
    return false if requiremnts.nil? || requiremnts.empty?
    requiremnts.none? do |requirement|
      SemanticRange.gtr(version, requirement)
    end
  end

  def prerelease?(platform, version)
    parsed_version = SemanticRange.parse(version) rescue nil
    return true if parsed_version && parsed_version.prerelease.length > 0
    if platform.downcase == 'rubygems'
      !!(version =~ /[a-zA-Z]/)
    else
      false
    end
  end
end
