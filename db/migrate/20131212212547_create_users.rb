class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :null => false
      t.string :password_digest, :null => false
      t.string :session_token, :null => false

      t.timestamps
    end

    add_index :users, :user_name
    add_index :users, :password_digest
    add_index :users, :session_token, :unique => true
  end
end