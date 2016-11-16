class ProjectsController < ApplicationController
	def index
		@projects = Project.order(created_at: :desc).limit(10)
	end

	def show
		@project = Project.find_by_id(params[:id])
		unless @project
			render "project_not_found"
		end
	end
end
