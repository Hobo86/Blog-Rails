class CreateCategory < ActiveRecord::Migration
  def change
    create_table :category do |t|
      t.string :name

      t.timestamps
    end
  end
end
