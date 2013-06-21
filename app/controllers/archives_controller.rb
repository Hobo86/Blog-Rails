class ArchivesController < ApplicationController
  
  def index
    #join_str = "LEFT JOIN posts b ON DATE_FORMAT(a.created_at, '%Y-%m') = DATE_FORMAT(b.created_at, '%Y-%m') AND a.id <b.id"
    #fields = "a.*,DATE_FORMAT(a.created_at, '%Y-%m') as month"
    #@posts = Post.from("posts a").joins(join_str).select(fields).where("b.id is NULL").order("created_at DESC")
    
    @posts = Post.order("created_at DESC").all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  
  def show
    @archive = params[:id]
    @posts = Post.where("DATE_FORMAT(created_at, '%Y-%m') = ?", @archive).order("created_at DESC,id DESC")
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @posts }
    end
  end
end
