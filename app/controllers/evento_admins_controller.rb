class EventoAdminsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
  	@eventosadmin = EventoAdmin.all
  	if params[:id].present?
  		@eventoadmin = EventoAdmin.find(params[:id])
  	else
  		@eventoadmin = EventoAdmin.new
  	end
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

  def edit
  	@eventosadmin = EventoAdmin.all
  	@eventoadmin = EventoAdmin.find(params[:id])
  	render :index
  end

  def update
  	@evento = EventoAdmin.find(params[:id])
  	respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to evento_admins_path, notice: 'Evento was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @evento = EventoAdmin.find(params[:id])
    authorize @evento
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to evento_admins_path, notice: 'Evento was successfully destroyed.' }
    end
  end

   private
    # Only allow a list of trusted parameters through.
    def evento_params
      params.require(:evento_admin).permit(:comuna_id, :descripcion, :url, :photo)
    end
end
