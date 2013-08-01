class User < ActiveRecord::Base
  #attr_accessible :email, :nickname, :password, :password_confirmation
 	validates :nickname,:presence => true,
        			     		:length => { :minimum => 2 },
                    	:uniqueness => true
  validates :email,		:uniqueness => true,
          						:format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,:multiline => true,:message => "Format error!" },
          						:if => "email?"
  validates :password,:confirmation => true,
          						:presence => true,
        			     		:length => { :minimum => 6},
        			     		:if => "nickname.presence&&nickname.length>1"

  def self.authenticate?(nickname, password)
    user = self.authenticate(nickname, password)
    return false if user.nil?
    return true if user.nickname == nickname

    false
  end

  def self.authenticate(nickname, password)
    where("nickname=? AND password=?", nickname, password).first
  end

  def admin?
    self.id <= 5
  end		     		       						
end
