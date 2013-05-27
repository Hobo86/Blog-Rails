class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :posts, :dependent => :destroy, :order => "created_at DESC"
  has_many :new_posts, :class_name => "Post",:order => "created_at DESC"
end
