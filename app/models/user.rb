class User < ApplicationRecord
  before_save do
    self.email.downcase! if self.email
  end
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum:5}
  

  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      return @user.authenticate(password)
    else
      return nil
    end
  end

end
