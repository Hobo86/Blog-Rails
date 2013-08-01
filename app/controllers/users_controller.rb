class UsersController < ApplicationController
	#登录验证
	before_filter :authenticate, :except => [:login, :show, :verify, :register, :create]

	def show
		respond_to do |format|
      format.html # show.html.erb
  	end
	end
	
  def login
		if @_current_user
			respond_to do |format|
      	format.html { redirect_to @_current_user }
  		end
		else
			@user = User.new
			respond_to do |format|
				format.html # login.html.erb
			end
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
		if @_current_user
			respond_to do |format|
      	format.html { redirect_to @_current_user }
  		end
		else
			@user = User.new
			respond_to do |format|
	      format.html # register.html.erb
	  	end
		end
	end

	def create
		params.permit!
		@user = User.new(params[:user])

		respond_to do |format|
      if @user.save
        format.html { render login_users_path, notice: 'Register Success!' }
      else
      	format.html { render register_users_path, notice: 'Register error!'}
      end
    end
	end

	private 

  def user_params
    params.require(:user).permit(:email, :nickname, :password)
  end

end
