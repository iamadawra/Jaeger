FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com"}
    password "password"
    first_name "test"
    middle_name "1"
    last_name "account"
    is_admin false
    role "user"
  end
end
