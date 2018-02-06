class User < ActiveRecord::Base	
	has_secure_password

	has_many :items
	has_many :deliveries
	



	before_save :downcase

	validates :first_name, :last_name, :city, presence: true, length: { in: 2..40 }
	validates :state, length: { is: 2 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i }

	def downcase
		self.first_name.downcase!
		self.last_name.downcase!
		self.email.downcase!
		self.state.downcase!
		self.city.downcase!
	end
end
