class User < ApplicationRecord

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i	# You can check it on Rubular

	before_save{self.email = email.downcase}

	validates(:name, presence: true, length:{maximum: 50})
	validates(:email, presence: true, length:{maximum: 255},
					  format:{with: VALID_EMAIL_REGEX},
					  uniqueness: {case_sensitive: false})
	has_secure_password		# => Add virtual parameters (:password, :password_confirmation)
							# => Add 'authenticate' method to the model object (User)

	validates(:password, presence: true, length:{minimum: 6})

end
