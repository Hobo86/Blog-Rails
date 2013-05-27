class WelcomeController < ApplicationController
  skip_before_filter :require_login, :only => [:index]
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json:@post }
      format.json { render json:@categories}
    end
  end
end
