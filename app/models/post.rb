class Post < ActiveRecord::Base
    belongs_to :category
    
  	attr_accessible :content, :name, :title, :tags_attributes, :categories_attributes
	  validates :name,  	:presence => true
  	validates :title, 	:presence => true,
            			      :length => { :minimum => 5 },
                        :uniqueness => { :message => "Message"}
    has_many :comments, :dependent => :destroy
    
    has_many :tags
  	accepts_nested_attributes_for :tags, :allow_destroy => :true,
  	:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
    
    #has_many :archive_posts, :class_name => "Post", :conditions => "DATE_FORMAT(created_at, '%Y-%m') = DATE_FORMAT(created_at, '%Y-%m')", :order => "created_at DESC"
    #has_many :archive_posts, :class_name => "Post", :conditions => "created_at = created_at", :order => "created_at DESC"
    #has_many :archive_posts, :class_name => "Post", :association_foreign_key =>"DATE_FORMAT(created_at, '%Y-%m')",:foreign_key => "DATE_FORMAT(created_at, '%Y-%m')", :order => "created_at DESC"
    #has_many :archive_posts, :class_name => "Post", :foreign_key => "DATE_FORMAT(created_at, '%Y-%m')",
    
    has_many :archive_posts, :class_name => "Post", :foreign_key => "category_id", :primary_key => "categor_id"
    belongs_to :archive, :class_name => "Post" 
end