require 'rails_helper'

describe Event do
  describe '#create' do
    it '全項目が入っていれば有効' do
      event = build(:event)
      event.images.build(attributes_for(:image))
      expect(event).to be_valid
    end

    it 'タイトルがないと無効' do
      event = build(:event, title: nil)
      event.images.build(attributes_for(:image))
      event.valid?
      expect(event.errors[:title]).to include('を入力してください')
    end

    it 'アドレスがないと無効' do
      event = build(:event, address: nil)
      event.images.build(attributes_for(:image))
      event.valid?
      expect(event.errors[:address]).to include('を入力してください')
    end

    it '開始時間がないと無効' do
      event = build(:event, start_time: nil)
      event.images.build(attributes_for(:image))
      event.valid?
      expect(event.errors[:start_time]).to include('を入力してください')
    end

    it '終了時間がないと無効' do
      event = build(:event, end_time: nil)
      event.images.build(attributes_for(:image))
      event.valid?
      expect(event.errors[:end_time]).to include('を入力してください')
    end

    it '画像がないと無効' do
      event = build(:event)
      event.valid?
      expect(event.errors[:images]).to include('を入力してください')
    end

    it '説明がないと無効' do
      event = build(:event, description: nil)
      event.images.build(attributes_for(:image))
      event.valid?
      expect(event.errors[:description]).to include('を入力してください')
    end

    it '募集人数がないと無効' do
      event = build(:event, capacity: nil)
      event.images.build(attributes_for(:image))
      event.valid?
      expect(event.errors[:capacity]).to include('を入力してください')
    end
  end
end