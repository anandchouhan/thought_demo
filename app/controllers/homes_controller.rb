class HomesController < ApplicationController
  add_breadcrumb "home", :root_path, :options => { :title => "Home" }

  def index
    @users = User.all
  end

  def new
    flash[:notice] = t('hello')
  end

  def search
    if params[:post].nil?
      @all = []
    else
      @all = Post.search params[:post]
    end
  end


  def create
    users_projects = User.joins(:projects).where("user_id =? and project_id =?", params[:user_id], params[:project_id])
    if users_projects.blank?
      user = User.find(params[:user_id])
      project = Project.find(params[:project_id])
      user.projects << project
    end
    redirect_to homes_path
  end

end
