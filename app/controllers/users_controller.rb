class UsersController < ApplicationController

	def show
		respond_to do |format|
      format.html # show.html.erb
  	end
	end
	
  def login
  	@user = User.new
		respond_to do |format|
      format.html # login.html.erb
  	end
	end

	def verify
		respond_to do |format|
			if @user = User.authenticate(params[:nickname], params[:password])
				session[:current_user_id] = @user.id
				format.html { redirect_to root_url, notice: 'Login Success!' }
			else
				format.html { redirect_to :back, notice: 'Login error!' }
			end
		end
	end

	def logout
		userId = session[:current_user_id]
		if userId
			session[:current_user_id] = nil
			respond_to do |format|
				format.html { redirect_to root_url, notice: 'Logout Success!' }
			end
		else
			format.html { redirect_to :back, notice: 'Not login!' }
		end
	end

	def register
		@user = User.new
		respond_to do |format|
      format.html # register.html.erb
  	end
	end

	def create
		@user = User.new(params[:user])

		respond_to do |format|
      if @user.save
        format.html { render action: "login", notice: 'Register Success!' }
      else
        format.html { redirect_to :back, notice: 'Register Error!'  }
      end
    end
	end

end
