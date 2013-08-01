class CreateComment < ActiveRecord::Migration
  def change
    create_table :comment do |t|
      t.references :post
      t.references :user
      t.string :title
      t.string :content

      t.timestamps
    end
    add_index :comment, :post_id
    add_index :comment, :user_id
  end
end
