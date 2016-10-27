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
* rake db:setup
* rake import_stock_csv:create_companies_and_exchanges

To run
* rails server

To test
* rspec spec

Documentation and Support
-------------------------
### API - Endpoints
#### Stock History
Returns last 30 days of stock price history
* company/:symbol/history
    * <code>GET</code> /company/:symbol/history
* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[{low:'', high:'', open:'', close:'', trade_date:'', ...stockInfo}, ...histories]`
 
* **Error Response:**

  * **URL:** <code>GET</code> /company/NONEXISTENT/history <br />
    **Code:** 404 NOT FOUND <br />
    **ResponseMessage:** `"No History Found For :symbol"`
    
  * **URL:** <code>GET</code> /company/^/history <br />
    **Code:** 400 BAD REQUEST <br />
    **ResponseMessage:** `"Symbol is required"`
