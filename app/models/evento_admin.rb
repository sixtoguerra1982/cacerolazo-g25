class EventoAdmin < ApplicationRecord
  belongs_to :comuna
  belongs_to :user
  validates :descripcion, presence: true 
  def pertenece_to_user(user)
  	if user.present? && self.user_id == user.id
  		true
  	else
  		false
  	end
  end
end
