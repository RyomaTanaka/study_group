class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foregin_key: true
      t.string :title
      t.string :place
      t.string :start_time
      t.string :end_time
      t.text :description
      t.timestamps
    end
  end
end
