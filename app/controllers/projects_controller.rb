class ProjectsController < ApplicationController
    def index
        @projects = Project.all
      end
    
      def new
        @project = Project.new
      end
    
      def create
        @project = Project.new(project_params)
        if @project.save
          flash[:notice] = '投稿しました！'
          redirect_to projects_path
        else
          flash.now[:alert] = '入力内容が正しくありません'
          render :index
        end
      end
    
      def edit
        @project = Project.find(params[:id])
      end
    
      def show
      end
    
      def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        redirect_to projects_path
      end
    
      def destroy
      end
    
      private
    
      def project_params
        params.require(:project)
        .permit(:client_id, :project_name, 
                :project_content, :skills,
                :skill_level, :budget
            )
      end

end
