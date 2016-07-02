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

	validates :period, numericality: { only_integer: true, greater_than: 0 }
	validates :prize, numericality: { only_integer: true, greater_than: 0 }
	validates :prize_num, numericality: { only_integer: true, greater_than: 0 }

	has_many :vc_relations

	before_save :clean_link

	def clean_link
		self.poster = self.poster.split('amazonaws.com/').last
	end
end
