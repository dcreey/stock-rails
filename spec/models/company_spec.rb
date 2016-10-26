require 'rails_helper'

describe 'Company Model Tests' do
  it 'should not save without name or symbol' do
    build(:company, symbol: nil, name: nil).should_not be_valid
  end

  it 'should not save without symbol' do
    build(:company, symbol: nil).should_not be_valid
  end

  it 'should not save without name' do
    build(:company, name: nil).should_not be_valid
  end

  it 'should save with both name and symbol' do
    build(:company).should be_valid
  end

  it 'should return all companies when empty string passed' do
    company_one = create(:company, name: "One")
    company_two = create(:company, name: "Two")
    companies = Company.get_all('')
    expect(companies.size).to equal(2)
  end

  it 'should return all companies when nil passed' do
    company_one = create(:company, name: "One")
    company_two = create(:company, name: "Two")
    companies = Company.get_all(nil)
    expect(companies.size).to equal(2)
  end

  it 'should return Apple Inc. company when Apple Name passed' do
    company_one = create(:company, name: "Apple Inc.")
    companies = Company.get_all('Apple Inc.')
    expect(companies.size).to equal(1)
  end
end