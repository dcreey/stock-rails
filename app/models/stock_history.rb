class StockHistory
  def initialize
    @api = YahooAPI.new
  end

  def self.get_by_symbol(symbol)
    @api.get_stock_history_by_symbol(symbol)
  end
end