class Competition < ActiveRecord::Base
	validates_presence_of :title
	validates_presence_of :start_date
	validates_presence_of :period
	validates_presence_of :prize
	validates_presence_of :prize_num
	validates_presence_of :poster

	validates :title, length: { minimum: 2 }
  	validates :title, length: { maximum: 50 }
  	validates :desc, length: { maximum: 500 }

  	validates_format_of :title, :with => /\A[0-9a-zA-Z\s\.\-\_]+\z/, :on => :create
	validates_format_of :period, :with => /\A([0-9])+\Z/i, :on => :create
	validates_format_of :prize, :with => /\A([0-9]+)\Z/i, :on => :create
	validates_format_of :prize_num, :with => /\A([0-9]+)\Z/i, :on => :create
end
