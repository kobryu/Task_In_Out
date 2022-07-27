# Admin.create!(
#     email: 'testtest@gmail.com',
#     password: 'test1234',
# )

20.times do |n|
  User.create!(
    last_name: Faker::Name.unique.last_name,
    first_name: Faker::Name.unique.first_name,
    last_name_kana: "テスト",
    first_name_kana: "テスト",
    email: Faker::Internet.unique.email,
    telephone_number: Faker::PhoneNumber.unique.cell_phone,
    password: "3150test",
    password_confirmation: "3150test"
  )
end