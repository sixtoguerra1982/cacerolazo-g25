class EventoAdminsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
  	@eventosadmin = EventoAdmin.all
  	@eventoadmin = EventoAdmin.new
  	authorize @eventosadmin
  end
end
