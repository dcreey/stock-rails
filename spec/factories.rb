class Factories
  FactoryGirl.define do
    factory :company do |f|
      f.name   "Web.com Group, Inc."
      f.symbol "WEB"
    end
  end
  FactoryGirl.define do
    factory :exchange do |f|
      f.name   "NASDAQ"
    end
  end
  FactoryGirl.define do
    factory :stock_history do |f|
    end
  end
end