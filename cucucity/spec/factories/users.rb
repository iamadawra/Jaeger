FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"
    sequence(:username) { |n| "test#{n}" }
    is_admin false
    role "user"

    factory :invalid_user do
      email nil
      password nil
    end
  end
end
