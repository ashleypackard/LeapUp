class AddForeignKeysToAccountCategories < ActiveRecord::Migration
  def change
  
  add_foreign_key :account_categories, :accounts
  add_foreign_key :account_categories, :categories

  end
end
