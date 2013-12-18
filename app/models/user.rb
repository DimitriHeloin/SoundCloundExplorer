class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.get_or_create_from_omniauth(hash)
    user = self.find_by(provider: hash["provider"], uid: hash["uid"])

    unless user
      pass = SecureRandom.hex(32)

      user = User.new(provider: hash["provider"],
                      uid: hash["uid"],
                      email: hash["info"]["email"],
                      password: pass,
                      password_confirmation: pass)

      user.save

    end

    user
  end

  def admin?
    # false
    true
  end

end
