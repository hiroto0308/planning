FactoryBot.define do
  factory :event do
    product { 'hoge' }
    introduction { Faker::Lorem.sentence }
    category_id { 2 }
    time_all_id { 2 }
    price { 500 }
    delivery_area_id { 2 }
    start { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    time_start { "11:00:00" }
    association :user
  end
end
