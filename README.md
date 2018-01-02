# Bitcoin Wallet Watcher

* Ruby version - 2.4.2

* Rails version - 5.1

This simplistic app will help you track transactions related to a wallet address.

The code is structured as:
- Views: All the HTML for the views resides here
- Controllers: All the actions triggered from views are defined here
- Services: All the business logic resides here

To get this app running follow these steps:
1. Clone the repo and run `bundle install`
2. To run the app - `bundle exec foreman start`
3. Visit [localhost:7300](http://localhost:7300), enter a valid wallet address and watch the magic unfurl!

To run the test suite:
1. Clone the repo and run `bundle install`
2. To see the tests in action run `bundle exec foreman run rails test`
