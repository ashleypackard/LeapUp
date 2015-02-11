class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, limit: 75
      t.string :body
      t.string :location
      t.date :meeting_date
      t.time :meeting_time

      t.timestamps null: false
    end
  end
end
