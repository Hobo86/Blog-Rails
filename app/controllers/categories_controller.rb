class CategoriesController < ApplicationController
	http_basic_authenticate_with :name => "Steven", :password => "123456", :except => [:index, :show]
  
  def index
    @categories = Category.includes("posts").order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end
  
  def show
    @category = Category.includes("posts").find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category} 
      
    end
  end
  
  def new
    
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
