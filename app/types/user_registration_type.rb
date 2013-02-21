class UserRegistrationType < User
  include BasicType

  attr_accessible :password_confirmation, :state_event

  #has_secure_password

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :city, presence: true
  validates :password, presence: true, confirmation: true
  

  def city=(city)
    write_attribute(:city, city.downcase)
  end

end