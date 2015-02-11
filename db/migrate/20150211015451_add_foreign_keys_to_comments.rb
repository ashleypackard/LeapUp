class AddForeignKeysToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :account_id, :integer
    add_column :comments, :post_id, :integer

	  add_foreign_key :comments, :accounts
	  add_foreign_key :comments, :posts
  end
end
