class User < ActiveRecord::Base
  attr_accessible :user_name, :password_digest, :session_token

  validates :user_name, :password_digest, :session_token, :presence => true

  before_validation :generate_session_token

  def generate_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
  end

end
