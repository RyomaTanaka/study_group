FactoryBot.define do
  factory :event, class: Event do
    title { 'テスト勉強会' }
    address { '東京タワー' }
    start_time { '2020/01/01 15:00' }
    end_time { '2020/01/01 20:00' }
    description { 'よろしくお願いします！' }
    capacity { '3' }
    organaizer { '1' }

    factory :event_one_images do
      after(:build) do |event|
        event.images << build(:image)
      end
    end

    factory :event_two_images do
      after(:build) do |event|
        2.times { event.images << build(:image) }
      end
    end

    factory :event_three_images do
      after(:build) do |event|
        3.times { event.images << build(:image) }
      end
    end
  end
end