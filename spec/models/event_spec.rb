require 'rails_helper'
describe Event do
  describe '#create' do
    it "タイトルがないと無効" do
      event = Event.new(title: "", address: "東京タワー", start_time: "2020/01/01 16:30", end_time: "2020/01/01 18:30", description: "よろしくお願いします。", capacity: "5", organaizer: "1")
      event.valid?
      expect(event.errors[:title]).to include("を入力してください")
    end

    it "アドレスがないと無効" do
      event = Event.new(title: "テスト勉強会", address: "", start_time: "2020/01/01 16:30", end_time: "2020/01/01 18:30", description: "よろしくお願いします。", capacity: "5", organaizer: "1")
      event.valid?
      expect(event.errors[:address]).to include("を入力してください")
    end
  end
end