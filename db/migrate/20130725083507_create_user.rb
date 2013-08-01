class CreateUser < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :nickname
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
