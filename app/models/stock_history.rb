require_relative '../../lib/apis/yahoo_api'

class StockHistory
  def initialize
    @api = YahooAPI.new
  end

  def get_by_symbol(symbol)
    @api.get_stock_history_by_symbol(symbol)
  end
end