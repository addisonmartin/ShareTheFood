# Share the Food
www.sharethefood.net

[![CI Build Status](https://ci-build-status.herokuapp.com/last.svg)](https://dashboard.heroku.com/pipelines/0643d4f8-b56d-4f75-88cf-e9de954537e9/tests)

## Overview

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/addisonmartin/ShareTheFood/issues.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[code of conduct](https://github.com/addisonmartin/ShareTheFood/blob/master/CODE_OF_CONDUCT.md).
See the [Development section](https://github.com/addisonmartin/ShareTheFood/blob/master/README.md#Development) for instructions on how to setup your development environment.

## License

The gem is available as open source under the terms of the [GNU General Public License 3.0 (GPL-3.0)](https://opensource.org/licenses/GPL-3.0).

## Code of Conduct

Everyone interacting in the Share the Food's codebase, issue trackers, etc. is expected to follow the
[code of conduct](https://github.com/addisonmartin/ShareTheFood/blob/master/CODE_OF_CONDUCT.md).


## Development

You will need the following technologies and versions installed on your local machine:
* Ruby

* Postgresql

* NPM

* Yarn

* Redis

Once everything is installed and configured, run the following commands within the project's root directory:

* bundle install

* yarn install

* rake db:create

* rake db:migrate

* rake db:seed

* rails server

Visit localhost:3000 and enjoy!

To run the application's tests run

* rspec

If you add new code, please add tests to support it.

You should also ensure rubocop passes:

* rubocop

Pushes to master are automatically deployed to Heroku.