class EventoAdminPolicy < ApplicationPolicy
  def index?
    return true if user.present? && user.admin?
  end

  def create
  	return true if user.present? && user.admin?
  end
 

  private
 
    def evento
      record
    end
end