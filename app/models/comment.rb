class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body,  :commenter
	validates :commenter,   :presence => true,
          			          :length => { :minimum => 4 }
  validates :body,  :presence => true,
            			  :length => { :minimum => 2 }
end
