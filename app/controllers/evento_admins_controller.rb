class EventoAdminsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
  	@eventosadmin = EventoAdmin.all
  	@eventoadmin = EventoAdmin.new
  end

  def create
  	@evento = EventoAdmin.new(evento_params)
    @evento.user = current_user
    authorize @evento
    respond_to do |format|
      if @evento.save
        format.html { redirect_to evento_admins_path, notice: 'Evento was successfully created.' }
      else
      	@eventoadmin = @evento
      	@eventosadmin = EventoAdmin.all
        format.html { render :index }
      end
    end
  end

   private
    # Only allow a list of trusted parameters through.
    def evento_params
      params.require(:evento_admin).permit(:comuna_id, :descripcion, :url, :photo)
    end
end
