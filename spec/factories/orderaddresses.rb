FactoryBot.define do
  factory :order_address do
    post_code      {'123-4567'}
    area_id        {'2'}
    city           {'あああああ'}
    addresses      {'あああああ'}
    building       {'あああああ'}
    phone_number   {'09012345678'}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
