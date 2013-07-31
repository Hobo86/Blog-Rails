class CreatePost < ActiveRecord::Migration
  def change
    create_table :post do |t|
    	t.references :user
    	t.references :category
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :post, :user_id
    add_index :post, :category_id
  end
end
