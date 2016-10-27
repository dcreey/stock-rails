require 'csv'

namespace :import_stock_csv do
  task :create_companies_and_exchanges => :environment do
    project_dir = File.expand_path("../../../", __FILE__)

    csv_path_amex = File.join(project_dir, 'db/data/companylist_amex.csv')
    csv_path_nasdaq = File.join(project_dir, 'db/data/companylist_nasdaq.csv')
    csv_path_nyse = File.join(project_dir, 'db/data/companylist_nyse.csv')

    exchange_amex = Exchange.find_or_create_by(:name => 'amex')
    exchange_nasdaq = Exchange.find_or_create_by(:name => 'nasdaq')
    exchange_nyse = Exchange.find_or_create_by(:name => 'nyse')

    import_and_load_data(csv_path_amex, exchange_amex.id)
    puts "companylist_amex.csv processed"
    import_and_load_data(csv_path_nasdaq, exchange_nasdaq.id)
    puts "companylist_nasdaq.csv processed"
    import_and_load_data(csv_path_nyse, exchange_nyse.id)
    puts "companylist_nyse.csv processed"
  end
end

# read data from csv and create company record for each one
def import_and_load_data(path, exchange_id)
  csv_text = File.read(path)
  csv = CSV.parse(csv_text,
                  :headers => true,
                  :converters => :all,
                  :header_converters => lambda { |h| h.downcase.gsub(' ', '_') })
  csv.each do |row|
    row = row.to_hash
    Company.create(
        name: convert_string(row['name']),
        symbol: convert_string(row['symbol']),
        market_cap: convert_float(row['marketcap']),
        last_sale: convert_float(row['lastsale']),
        adr_tso: convert_int(row['adr_tso']),
        ipo_year: convert_int(row['ipoyear']),
        sector: convert_string(row['sector']),
        industry: convert_string(row['industry']),
        summary_quote: convert_string(row['summary_quote']),
        exchange_id: exchange_id
    )
  end
end

# data validation and conversion for csv import process
def convert_string(value)
  if value.nil?
    ''
  elsif value.to_s.strip == 'n/a'
    ''
  else
    value.to_s
  end
end

def convert_float(value)
  if value.nil?
    0.0
  elsif value.to_s.strip == 'n/a'
    0.0
  else
    value.to_f
  end
end
def convert_int(value)
  if value.nil?
    0
  elsif value.to_s.strip == 'n/a'
    0
  else
    value.to_d
  end
end
