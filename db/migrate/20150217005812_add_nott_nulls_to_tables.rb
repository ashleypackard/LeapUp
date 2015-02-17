class AddNottNullsToTables < ActiveRecord::Migration
  def change

		change_column :posts, :title, :string, null: false
		change_column :posts, :body, :text, null: false
		change_column :posts, :location, :string, null: false
		change_column :posts, :meeting_date, :date, null: false
		change_column :posts, :meeting_time, :time, null: false
		change_column :posts, :account_id, :int, null: false
		change_column :posts, :category_id, :int, null: false

		change_column :comments, :body, :text, null: false
		change_column :comments, :account_id, :int, null: false
		change_column :comments, :post_id, :int, null: false

		change_column :categories, :name, :string, null: false

		change_column :accounts, :first_name, :string, null: false
		change_column :accounts, :last_name, :string, null: false
		change_column :accounts, :email, :string, null: false
		change_column :accounts, :password_digest, :string, null: false

		change_column :account_categories, :account_id, :int, null: false
		change_column :account_categories, :category_id, :int, null: false

  end
end
