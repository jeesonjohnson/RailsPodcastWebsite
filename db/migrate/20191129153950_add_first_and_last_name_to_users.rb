class AddFirstAndLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, null: false, default: 'error'
    add_column :users, :last_name, :string, null: false, default: 'error'
  end
end
