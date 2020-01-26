FactoryBot.define do
  factory :user do
    nickname                { 'テスト太郎' }
    email                   { 'test@test.com' }
    icon                    { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'image/jpeg') }
    password                { 'password' }
    password_confirmation   { 'password' }
    introduction            { 'よろしくお願いします！' }
  end
end
