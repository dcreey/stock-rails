require 'rails_helper'

describe 'Exchange Model Tests' do

  it 'should not save without name' do
    build(:exchange, name: nil).should_not be_valid
  end

end