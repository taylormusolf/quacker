class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end


  def show
    # debugger
    @post = Post.find(params[:id])
    render :show
  end


  def new
    render :new
  end


  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end


  # def create
  #   @post = Post.new(post_params)
  #   # debugger
  #   # @post.author = User.first # either of these two will do the same thing
  #   @post.author_id = User.first.id # either of these two will do the same thing
  #   if @post.save # use '#save' instead of '#save!' so that the code can continue past the line if there's an error
  #     # debugger
  #     redirect_to post_url(@post) # <-- can pass in the whole post, or just the id. either works
  #   else
  #     # debugger
  #     render json: @post.errors.full_messages, status: 422
  #   end
  # end

  # def update
  #   # debugger
  #   @post = Post.find(params[:id])

  #   if @post.update(post_params)
  #     redirect_to post_url(@post)
  #   else
  #     render json: @post.errors.full_messages, status: 422
  #   end
  # end


  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to posts_url
  end


  private
  def post_params
    params.require(:post).permit(:body) # Creates strong params
  end
end