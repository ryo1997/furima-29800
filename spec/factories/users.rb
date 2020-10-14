FactoryBot.define do
  factory :user do
    nickname              { 'aa' }
    email                 { 'aa@aa' }
    password              { 'aa1234' }
    password_confirmation { 'aa1234' }
    first_name            { '阿部' }
    last_name             { '太' }
    first_name_kana       { 'アベ' }
    last_name_kana        { 'フトシ' }
    birthday              { '1930-01-01' }
  end
end
