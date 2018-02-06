class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :delivery

  before_save :downcase

  validates :name, :city, presence: true, length: { in: 2..40 }
  validates :description, length: { in: 10..300 }
  validates :state, length: { is: 2 }


	def downcase
		self.name.downcase!
		self.city.downcase!
		self.state.downcase!
		self.del_city.downcase!
		self.del_state.downcase!
	end
end
