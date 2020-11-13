FactoryBot.define do
  factory :buyer_form do
    token          {"tok_abcdefghijk00000000000000000"}
    post           {'000-0000'}
    prefecture_id  {2}
    municipality   {'横浜市緑区'}
    address        {'青山1-1-1'}
    phone          {'09012345678'}
  end
end
