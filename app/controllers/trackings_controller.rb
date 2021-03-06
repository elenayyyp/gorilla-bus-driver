class TrackingsController < ApplicationController
  def index
    trackings = Tracking.all
    render json: trackings
  end

  def show
    tracking = Tracking.where(id: params[:id])
    render json: tracking
  end

  def create
    new_tracking = Tracking.new(lat: params[:lat], lng: params[:lng], driver_id: params[:driver_id], shuttle_id: params[:shuttle_id])

    if new_tracking.save
      render json: new_tracking
    else
      render json: {"error": new_tracking.errors}
    end
  end

  def update
    found_tracking  = Tracking.where(id: params[:id])
    updated = found_tracking.update(lat: params[:new_lat], lng: params[:new_lng], driver_id: params[:new_driver_id], shuttle_id: params[:shuttle_id])

    if updated
      render json: updated
    else
      render json: {"error": updated.errors}
    end
  end

  def destroy
    removed = Tracking.delete_all(shuttle_id: params[:shuttle_id])
    render json: {'Entry': removed}
  end
end
