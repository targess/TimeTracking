class TimeEntry < ApplicationRecord
	validates  :hours, presence: true
	belongs_to :project
end
