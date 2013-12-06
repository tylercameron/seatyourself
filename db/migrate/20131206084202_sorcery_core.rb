class SorceryCore < ActiveRecord::Migration
  def change
    add_column :users, :crypted_password, :string, default: nil
    add_column :users, :salt, :string, default: nil

    remove_column :users, :password_digest
  end
end