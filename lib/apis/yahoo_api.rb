require 'yahoo-finance'
require 'active_support'
require 'active_support/core_ext'

class YahooAPI
  def initialize
    # @yahoo_finance = YahooFinance.new
    @historical_data_to_include = [:low, :low_52_weeks, :low_limit,:high, :high_52_weeks, :high_limit, :open, :close ]
  end

  def get_stock_history_by_symbol(symbol)
    if symbol.blank?
      nil
    else
      begin
        yahoo_client = YahooFinance::Client.new
        yahoo_client.historical_quotes(symbol, { start_date: Time::now-(24*60*60*30), end_date: Time::now }) # 30 days worth of data
      rescue
        if $!.message.include? '404'
          []
        end
      ensure
        yahoo_client = nil
      end

    end
  end
end