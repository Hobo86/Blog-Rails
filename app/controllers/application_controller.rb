class ApplicationController < ActionController::Base
  #layout "main"
  protect_from_forgery
  before_filter :categories
  before_filter :archives
  #before_filter :require_login
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  #rescue_from User::NotAuthorized, :with => :user_not_authorized
 
  private
  
  def categories
    @categories_side = Category.all
  end
  
  def archives
    fields = "DATE_FORMAT(created_at, '%Y-%m') as month"
    @archives_side = Post.group("month").order("created_at DESC").select(fields)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/" # halts request cycle
    end
  end
 
  # logged_in? 方法简单地返回 true 如果用户已登录，否则返回 false 。
  # 它通过使用一个双 ! 操作符来“布尔化”我们之前创建的 current_user 方法。
  # 注意在 Ruby 中者不常见也不鼓励，除非你真的想要转换某物到 true 或 false 。
  def logged_in?
    !!false
  end
  
  def record_not_found
      render :text => "404 Not Found", :status => 404
  end
  
  def user_not_authorized
    flash[:error] = "You don't have access to this section."
    redirect_to :back
  end
end
