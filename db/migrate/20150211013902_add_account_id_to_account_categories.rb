class AddAccountIdToAccountCategories < ActiveRecord::Migration
  def change
    add_column :account_categories, :account_id, :integer
    add_column :account_categories, :category_id, :integer
  end
end
