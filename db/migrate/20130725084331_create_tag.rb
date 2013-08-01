class CreateTag < ActiveRecord::Migration
  def change
    create_table :tag do |t|
      t.references :post
      t.string :name

      t.timestamps
    end
    add_index :tag, :post_id
  end
end
