FactoryBot.define do
  factory :items do
    association :user
    items_name        {'あいうえお'}
    explain           {'あいうえお'}
    category_id       {'2'}
    condition_id      {'2'}
    delivery_id       {'2'}
    area_id           {'2'}
    shipping_date_id  {'2'}
    price             {'500'}

    after(:build) do |item|
      item.image.attach(io: File.open('app/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
