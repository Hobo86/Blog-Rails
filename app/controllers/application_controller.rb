class ApplicationController < ActionController::Base
  #layout "main"
  protect_from_forgery
  before_filter :recentPosts
  before_filter :categories
  before_filter :archives
  before_filter :current_user
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  #rescue_from User::NotAuthorized, :with => :user_not_authorized
 
  private

  def recentPosts
    fields = "id,title"
    @recent_posts = Post.order("created_at DESC").limit(3).select(fields)
  end
  
  def categories
    @categories_side = Category.all
  end
  
  def archives
    fields = "DATE_FORMAT(created_at, '%Y-%m') as month"
    @archives_side = Post.group("month").order("created_at DESC").select(fields)
  end
  
  def record_not_found
      render :text => "404 Not Found", :status => 404
  end
  
  def user_not_authorized
    flash[:error] = "You don't have access to this section."
    redirect_to :back
  end

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
  end

  def authenticate
    if @_current_user
      return true;
    else
      respond_to do |format|
        format.html { redirect_to login_users_path, notice: 'Need Login!' }
      end
    end
  end

  def admin_authenticate
    if @_current_user
      if @_current_user.admin?
        return true
      else
        respond_to do |format|
          format.html { redirect_to root_url, notice: 'No Access!' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to login_users_path, notice: 'Need Login!' }
      end
    end
  end
end
