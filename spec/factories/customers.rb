FactoryBot.define do
  factory :customer do
    nickname              {"テスト"}
    family_name           {"田中"}
    first_name            {"太郎"}
    email                 {"test@test"}
    phone_num             {"09012345678"}
    birthday              {"2000-02-02"}
    password              {"aaa000"}
    password_confirmation {password}
  end
end
