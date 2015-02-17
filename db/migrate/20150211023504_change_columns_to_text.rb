class ChangeColumnsToText < ActiveRecord::Migration
  def change

    change_column :accounts, :description, :text
	 
  end
end
