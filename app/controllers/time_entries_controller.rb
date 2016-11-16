class TimeEntriesController < ApplicationController
	def index
		@project = Project.find(params[:project_id])
		@entries = @project.time_entries.where('date > ?', 1.month.ago.end_of_month)
	end

	def new
		@my_project = Project.find(params[:project_id])
		@my_entry = @my_project.time_entries.new
	end
end
