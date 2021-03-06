class User < ActiveRecord::Base
  devise :invalidatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         omniauth_providers: [:google_oauth2, :facebook]

  def avatar_url
    if provider == 'facebook'
      avatar + "?width=800"
    else
      avatar
    end
  end

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first
    if user.nil?
      user = find_by_email(auth.info.email)
      # Instantiate the user for the first time
      if user
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.save
      end
    end

    if user.avatar.nil?
      user.avatar = auth.info.image
    end
    user
  end
end
