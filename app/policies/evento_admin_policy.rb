class EventoAdminPolicy < ApplicationPolicy
  
  def  create?
  	return true if user.present? && user.admin?
  end
 

  private
 
    def evento
      record
    end
end