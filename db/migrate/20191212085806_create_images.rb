# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :event, foregin_key: true
      t.string :image
      t.timestamps
    end
  end
end
