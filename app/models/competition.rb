class Competition < ActiveRecord::Base
	validates_presence_of :title
	validates_presence_of :start_date
	validates_presence_of :period
	validates_presence_of :prize
	validates_presence_of :prize_num
	validates_presence_of :poster

	validates_format_of :period, :with => /\A([0-9])+\Z/i, :on => :create
	validates_format_of :prize, :with => /\A([0-9]+)\Z/i, :on => :create
	validates_format_of :prize_num, :with => /\A([0-9]+)\Z/i, :on => :create
end
