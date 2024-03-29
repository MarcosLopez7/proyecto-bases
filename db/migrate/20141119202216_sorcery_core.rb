class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,		  :null => false
      t.string :email,            :null => false
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end