class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [ :normal, :admin ]
  has_one :evento
  has_many :eventoAdmins

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.email = auth.info.email
     	user.image = auth.info.image
  		user.password = Devise.friendly_token[0,20]
  		user.name = auth.info.name
  	end
  end       

end
