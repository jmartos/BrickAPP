class WorksController < ApplicationController

  before_action :require_login

  def show
    @work = current_user.works.find(params[:id])
  end

  def new
    @work = current_user.works.new
  end

  def create
    @work = current_user.works.new(work_params)
    if @work.save
      redirect_to profile_path(tab: :works)
    else 
      render "new"
    end
  end

  def edit
    @work = current_user.works.find(params[:id])
  end

  def update
    @work = current_user.works.find(params[:id]).update(work_params)
    redirect_to profile_path(tab: :works)
  end

  def destroy
    @work = current_user.works.find(params[:id]).destroy
    redirect_to profile_path(tab: :works)
  end

  private

  def work_params
    params.require(:work).permit(:code, :name, :address, :zip_code, :city, :state, :country, :client, :client_phone, :client_email)
  end
end
