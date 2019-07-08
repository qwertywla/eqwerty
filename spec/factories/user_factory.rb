FactoryBot.define do
  sequence(:email) {|n| "test#{n}@example.com"}

  factory :user do
    email
    password { "123456" }
    first_name { "User" }
    last_name { "Tester" }
    admin { false }
  end

  factory :admin do
    email
    password { "123456" }
    first_name { "Admin" }
    last_name { "Admins" }
    admin { true }
  end
end
