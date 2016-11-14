class SiteController < ApplicationController
	def home
	end

	def contact
	end

	def calculator
	end

	def calculate
		@first_num  = params[:first_num].to_f
		@second_num = params[:second_num].to_f
		@result		= @first_num + @second_num
	end
end
