class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_address, :uniq
    add_column :users, :password_digest, :string
    add_column :users, :phone_number, :string
    add_column :users, :string, :string
  end
end
