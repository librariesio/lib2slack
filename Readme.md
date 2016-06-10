# [Lib2Slack](https://libraries.io/github/librariesio/lib2slack)

Sinatra app for posting to slack whenever a new version of a dependency is discovered by [Libraries.io](https://libraries.io) using the repository web hook feature.

<img width="717" alt="screen shot 2016-06-10 at 11 10 41 am" src="https://cloud.githubusercontent.com/assets/1060/15961333/115a4744-2efc-11e6-97df-3ef6df87bc10.png">

## Usage

The easiest option is to deploy to heroku with the deploy button below:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Then add the url of your app to web hooks section for your repo on https://libraries.io

<hr>

Or to run it somewhere else, clone it from github:

   git clone https://github.com/librariesio/lib2slack.git

Install dependencies:

    bundle install

Setup config environment variables:

    SLACK_API_TOKEN=myslackapitoken
    SLACK_CHANNEL=#general

Start the app:

    rackup

Add the url of your app to web hooks section for your repo on https://libraries.io

## Development

Source hosted at [GitHub](https://github.com/librariesio/lib2slack).
Report issues/feature requests on [GitHub Issues](https://github.com/librariesio/lib2slack/issues). Follow us on Twitter [@librariesio](https://twitter.com/librariesio). We also hangout on [Gitter](https://gitter.im/librariesio/support).

### Getting Started

New to Ruby? No worries! You can follow these instructions to install a local server, or you can use the included Vagrant setup.

#### Installing a Local Server

First things first, you'll need to install Ruby 2.3.1. I recommend using the excellent [rbenv](https://github.com/rbenv/rbenv),
and [ruby-build](https://github.com/rbenv/ruby-build)

```bash
rbenv install 2.3.1
rbenv global 2.3.1
```

### Note on Patches/Pull Requests

 * Fork the project.
 * Make your feature addition or bug fix.
 * Add tests for it. This is important so I don't break it in a
   future version unintentionally.
 * Add documentation if necessary.
 * Commit, do not change procfile, version, or history.
 * Send a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2016 Andrew Nesbitt. See [LICENSE](https://github.com/librariesio/lib2slack/blob/master/LICENSE) for details.
