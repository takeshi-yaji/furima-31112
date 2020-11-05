FactoryBot.define do
  factory :item do
    name             {'あ'}
    content          {'あ'}
    category_id      {2}
    status_id        {2}
    charges_id       {2}
    prefecture_id    {2}
    price            {300}
    day_id           {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
