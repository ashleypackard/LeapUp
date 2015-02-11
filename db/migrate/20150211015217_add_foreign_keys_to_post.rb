class AddForeignKeysToPost < ActiveRecord::Migration
  def change

		add_column :posts, :account_id, :integer
    add_column :posts, :category_id, :integer

	  add_foreign_key :posts, :accounts
	  add_foreign_key :posts, :categories

  end
end
