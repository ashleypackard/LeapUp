class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :description
      t.string :phone_number, limit: 10

      t.timestamps null: false
    end
  end
end
