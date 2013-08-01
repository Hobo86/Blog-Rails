class CommentsController < ApplicationController
  http_basic_authenticate_with :name => "Steven", :password => "123456", :except => [:create]
  def create
    params.permit!
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.create(params[:comment])
  	redirect_to post_path(@post)
	end

	def destroy
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  	@comment.destroy
  	redirect_to post_path(@post)
	end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
