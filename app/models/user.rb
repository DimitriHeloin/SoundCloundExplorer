class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.get_or_create_from_omniauth(hash)
    user = self.find_by(provider: hash["provider"], uid: hash["uid"])

    unless user
      pass = SecureRandom.hex(32)

      user = User.new(provider: hash["provider"],
                      uid: hash["uid"],
                      username: hash["extra"]["raw_info"]["username"],
                      password: pass,
                      password_confirmation: pass,
                      authentification_token: hash["credentials"]["token"])

      user.save

    end

    user
  end

  def admin?
    # false
    true
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
