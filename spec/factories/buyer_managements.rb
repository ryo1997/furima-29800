FactoryBot.define do
  factory :buyer_management do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city {'春日部市'}
    house_number { '1-1' }
    phone_number { '09000000000' }
  end
end
