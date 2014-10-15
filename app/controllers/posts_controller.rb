class PostsController < ApplicationController
  
  before_action :prepare_project
 
  def create
    @post = @project.posts.build(posts_params)
    @post.user_id = params[:user_id]
    
    if @post.save
      redirect_to @project :notice => "posted successfully"
    end
  end

  def index
    @posts = @project.posts
  end

  def destroy
    @post.destroy
  end
  
  private
   
  def prepare_project
    @project = Project.find(params[:project_id])
    @post = @project.posts.find(params[:id]) if params[:id]
  end
    
  def posts_params
    params.require(:post).permit(:content, :published)
  end
end
