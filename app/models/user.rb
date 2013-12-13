class User < ActiveRecord::Base
  attr_accessible :user_name, :password, :session_token

  before_validation :generate_session_token

  validates :user_name, :password_digest, :session_token, :presence => true
  validates :password, :length => { :in => (6..20) }, :on => :create

  has_many :cats

  def generate_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    found_user = self.find_by_user_name(user_name)

    if found_user && found_user.is_password?(password)
      return found_user
    end

    nil
  end
end
