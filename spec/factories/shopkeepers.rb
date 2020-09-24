FactoryBot.define do
  factory :shopkeeper do
    family_name { "田中" }
    first_name { "太郎" }
    email { test@test.com }
    password { "aaa000" }
    password_confirmation { password }
    phone_num { "09012345678" }
    birthday { "2000-02-02" }
  end
end
