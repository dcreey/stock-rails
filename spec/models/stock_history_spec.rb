require 'rails_helper'

describe 'Stock History Model Tests' do
  it 'initiated model should expose get_by_symbol method' do
    build(:stock_history).should respond_to :get_by_symbol
  end
end