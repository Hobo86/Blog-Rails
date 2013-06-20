class ArchivesController < ApplicationController
  
  def index
    #join_str = "LEFT JOIN posts b ON DATE_FORMAT(a.created_at, '%Y-%m') = DATE_FORMAT(b.created_at, '%Y-%m') AND a.id <b.id"
    #fields = "a.*,DATE_FORMAT(a.created_at, '%Y-%m') as month"
    #@posts = Post.from("posts a").joins(join_str).select(fields).where("b.id is NULL").order("created_at DESC")
    
    fields = "id,title,content,created_at,DATE_FORMAT(created_at, '%Y-%m') as month"
    @posts = Post.order("created_at DESC").select(fields)
    
    @archives = Array.new
    @posts.each do |post|
      @month = post[:month]
      @archive
      if @archives.include?(@month)
        @archive = @archives[@month]
        @archive_posts = @archive[:posts]
      else
        @archive = Hash.new
        @archives.push(@archive)
        
        @archive_posts = Array.new
        @archive[:month] = @month
        @archive[:posts] = @archive_posts
      end
      
      @archive_posts.push(post)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @archives }
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
