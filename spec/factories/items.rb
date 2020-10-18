FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name               { 'aa' }
    description        { 'abcde' }
    genre_id           { 2 }
    condition_id       { 2 }
    shipping_charge_id { 2 }
    prefecture_id      { 2 }
    preparation_day_id { 2 }
    price              { '300' }
  end
end
