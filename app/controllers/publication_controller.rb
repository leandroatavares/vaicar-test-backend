class PublicationController < ApplicationController

  def display
    render :json => display_service.process
  end

  def create
    if create_service.process == 'ok'
      redirect_to '/'
    end
  end

  private

  def display_service
    @display_service ||= Publication::DisplayService.new
  end


  def create_service
    @create_service ||= Publication::CreateService.new(create_service_params)
  end

  def create_service_params
    params.permit(:owner, :description, :image_ref)
  end

end