class EventoPolicy < ApplicationPolicy
  def index?
    user.present?
  end
 
  def show?
    true
  end
  
  def create?
    return true if user.present? && user.admin?
  end
 
  def update?
    return true if user.present? && user == evento.user || user.admin?
  end
 
  def destroy?
    return true if user.present? && user == evento.user || user.admin?
  end
 
  def delete_image?
    return true if user.present? && user == evento.user || user.admin?
  end

  private
 
    def evento
      record
    end
end