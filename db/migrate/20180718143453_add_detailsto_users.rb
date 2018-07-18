class AddDetailstoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
  end
end
