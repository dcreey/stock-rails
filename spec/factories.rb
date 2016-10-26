class Factories
  FactoryGirl.define do
    factory :companies do |f|
      f.name   "Web.com Group, Inc."
      f.symbol "WEB"
    end
  end

end