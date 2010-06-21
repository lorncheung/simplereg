class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :birthdate
      t.string :location
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end