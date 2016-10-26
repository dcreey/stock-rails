require 'rspec'
require 'Company'
require_relative  '../../../lib/apis/yahoo_api'

describe 'Yahoo API Service Tests' do
  api = YahooAPI.new
  before :each do

  end

  it 'Should return a list of history for given stock symbol' do
    history = api.get_stock_history_by_symbol('FLWS')
    expect(history.size).to be >  1
    expect(history[0].low).to be_truthy
    expect(history[0].high).to be_truthy
    expect(history[0].open).to be_truthy
    expect(history[0].close).to be_truthy
  end

  it 'Should return nil if no stock symbol provided' do
    history = api.get_stock_history_by_symbol('')
    expect(history).to be_nil
  end

  it 'Should return nil if invalid stock symbol provided' do
    history = api.get_stock_history_by_symbol('AAAABBBZZZZ123')
    expect(history.size).to equal(0)
  end
end
