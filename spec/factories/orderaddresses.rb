FactoryBot.define do
  factory :useraddress do
    association :order
    post_code      {'123-4567'}
    area_id        {'2'}
    city           {'あああああ'}
    addresses      {'あああああ'}
    building       {'あああああ'}
    phone_number   {'09012345678'}
  end
end
