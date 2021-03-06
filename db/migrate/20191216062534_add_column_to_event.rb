# frozen_string_literal: true

class AddColumnToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :capacity, :integer
    add_column :events, :participant, :integer
    add_column :events, :holding, :boolean, default: true, null: false
    add_column :events, :organaizer, :integer
  end
end
