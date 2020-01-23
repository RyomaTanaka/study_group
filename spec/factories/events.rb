# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title                   { 'テスト勉強会' }
    address                 { '東京タワー' }
    start_time              { '2020/01/01 15:00' }
    end_time                { '2020/01/01 20:00' }
    description             { 'よろしくお願いします！' }
    capacity                { '3' }
    organaizer              { '1' }
  end
end
