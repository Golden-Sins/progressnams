
class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_confirmation_of :password
  has_secure_password
  after_destroy :ensure_an_admin_remains
  class Error < StandardError
  end

  def update_password(params)
    user_params = params[:user]
    user = User.find_by(name: user_params[:name])
    if user&.authenticate(user_params[:password])
      self.password = user_params[:new_password]
      self.save!
    else
      errors.add(:password, :invalid, message: "Current password is invalid")
      false
    end
  end

  private

  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new "Can't delete last user"
    end
  end
end