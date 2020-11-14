FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 't000000' }
    password_confirmation { password }
    last_name             { '斎藤' }
    first_name            { '一' }
    last_name_kana        { 'サイトウ' }
    first_name_kana       { 'ハジメ' }
    birthday              { '1990/10/23' }
  end
end
