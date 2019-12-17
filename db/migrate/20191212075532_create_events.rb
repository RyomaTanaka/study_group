class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :start_time
      t.string :end_time
      t.text :description
      t.timestamps
    end
  end
end
