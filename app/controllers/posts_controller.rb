class PostsController < ApplicationController

  def new
    @post = Post.new
    2.times { @post.comments.build }
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      logger.info "user post is #{@post.body}...."  
      redirect_to root_path
    end 
  end


  def edit
    @post = Post.find(params[:id])
    @post.comments
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    end
  end


  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
    #@q.result.includes(:comments)
  end

  def search
    index
    render :index
  end

  private
  def post_params
    params.require(:post).permit(:body, :comments_attributes=> [:id, :comnt_body, :post_id, :_destroy])
  end

end
