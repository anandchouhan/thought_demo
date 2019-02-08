class PostsController < ApplicationController
  add_breadcrumb "home", :root_path, :options => { :title => "Home" }

  def new
    @post = Post.new
    2.times { @post.comments.build }
    add_breadcrumb "index", posts_path
    add_breadcrumb "new", new_post_path
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
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


  # def index
  #   @q = Post.ransack(params[:q])
  #   @posts = @q.result
  #   #@q.result.includes(:comments)
  #   add_breadcrumb "index", posts_path
  # end

  # def search
  #   index
  #   render :index
  # end

  private
  def post_params
    params.require(:post).permit(:body, :comments_attributes=> [:id, :comnt_body, :post_id, :_destroy])
  end

end
