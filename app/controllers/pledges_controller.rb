class PledgesController < ApplicationController
  
 before_action :prepare_project
 
  def create
    @pledge = @project.pledges.build(posts_params)
    @pledge.user_id = params[:user_id]    
    if @pledge.save
      redirect_to @project, :notice => "pldege added successfully"
    end
  end

  def index
    @pledges = @project.pledges
  end

  def destroy
    @pledge.destroy
  end
  
  private
   
  def prepare_project
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.find(params[:id]) if params[:id]
  end
    
  def posts_params
    params.require(:pledge).permit(:desc, :amount)
  end
end
