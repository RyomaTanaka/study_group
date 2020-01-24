FactoryBot.define do
  factory :image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/image/test.jpeg')) }
    association :user
  end
end
