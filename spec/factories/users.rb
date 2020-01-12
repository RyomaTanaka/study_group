FactoryBot.define do

  factory :user do
    nickname                {"テスト太郎"}
    email                   {"テスト勉強会"}
    password                {"password"}
    password_confirmation   {"password"}
    introduction            {"よろしくお願いします！"}
  end

end