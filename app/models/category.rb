class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :posts, :class_name => "Post", :dependent => :destroy, :order => "created_at DESC"
end
