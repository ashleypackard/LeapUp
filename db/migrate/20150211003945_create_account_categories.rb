class CreateAccountCategories < ActiveRecord::Migration
  def change
    create_table :account_categories do |t|

      t.timestamps null: false
    end
  end
end
