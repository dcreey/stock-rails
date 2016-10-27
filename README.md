Stock Rails
================

Web app for searching publically traded companies and visualizing their recent price history.
* Database seeded with information from http://www.nasdaq.com/screening/company-list.aspx
* Recent stock price history retreived with yahoo-finance gem
* Visualization with d3.js

This application was initialized with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Ruby on Rails
-------------

This application requires:

- Ruby 2.3.1
- Rails 5.0.0.1

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------
To build this application, run the following command line operations:

* bundler install

To load the schema and import seed data
* rails db:load
* rails import_stock_csv:create_companies_and_exchanges

To run
* rails server

Documentation and Support
-------------------------
### API - Endpoints
#### Stock History
Returns last 30 days of stock price history
* company/history/:symbol
    * <code>GET</code> /company/history/:symbol
* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[{table:{...stockInfo}}, {table:{...stockInfo}}]`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "No history found for :symbol" }`
    
  * **Code:** 400 BAD REQUEST <br />
    **Content:** `{ error : "Symbol is required" }`
