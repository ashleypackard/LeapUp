class FixStringSizes < ActiveRecord::Migration
  def change
  	change_column :posts, :title, :string, limit: 75

  end
end
