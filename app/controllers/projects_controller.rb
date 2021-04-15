class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def index
    @projects = Project.all 
  end

  def create
    @workflow = CreatesProject.new(
      name: params[:project][:name],
      task_string: params[:project][:tasks]
    )
    @workflow.create
    if @workflow.success?
      redirect_to projects_path
    else
      # any information that was entered into the form will still display when the form is rerendered
      @project = @workflow.project
      render :new
    end
  end
end
