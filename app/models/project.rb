class Project < ApplicationRecord
	has_many :time_entries

	def self.clean_old(date = 1.week.ago)
		projects = self.where('created_at < ?', date)
		projects.destroy_all
	end
end
