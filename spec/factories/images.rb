FactoryBot.define do
  factory :image, class: Image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'),'spec/factories/test.jpg') }
  end
end