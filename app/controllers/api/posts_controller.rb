class Api::PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:author)
    render :index
  end

  def create
    @post = Post.new(post_params)
    # @post.author_id = current_user.id
    @post.author_id = 1;
    if @post.save
      render :show
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:body) # Creates strong params
  end
end