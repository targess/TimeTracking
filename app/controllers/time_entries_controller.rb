class TimeEntriesController < ApplicationController
	def index
		@my_project = Project.find(params[:project_id])
		# @entries = @project.time_entries.where('date > ?', 1.month.ago.end_of_month)
		@my_entries = @my_project.time_entries.all
	end

	def new
		@my_project = Project.find(params[:project_id])
		@my_entry = @my_project.time_entries.new
	end

	def create
		@my_project = Project.find(params[:project_id])
		@my_entry = @my_project.time_entries.new(entry_params)

		if @my_entry.save
			redirect_to "/projects/#{@my_project.id}/time_entries"
		else
			render "new"
		end
	end

	def edit
		@my_project = Project.find(params[:project_id])
		@my_entry = @my_project.time_entries.find (params[:id])
	end

	def update
		@my_project = Project.find(params[:project_id])
		@my_entry = @my_project.time_entries.find_by_id(params[:id])
		
		if @my_entry.update(entry_params)
			redirect_to "/projects/#{@my_project.id}/time_entries"
		else
			render "edit"
		end
	end

	def destroy
		@my_project = Project.find(params[:project_id])
		@my_project.time_entries.find_by_id(params[:id]).destroy

		redirect_to action: :index, project_id: @my_project.id
	end

	private

	def entry_params
		params.require(:time_entry).permit(:hours, :minutes, :date)
	end
end
