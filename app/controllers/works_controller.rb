class WorksController < ApplicationController

  before_action :require_login
  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def show
    #@work = Work.get_from_user(params[:id], current_user)
    #current_user.works.find(params[:id])
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
    #@work = current_user.works.find(params[:id])
  end

  def update
    @work.update(work_params)
    #@work = current_user.works.find(params[:id]).update(work_params)
    redirect_to profile_path(tab: :works)
  end

  def destroy
    @work.destroy
    #@work = current_user.works.find(params[:id]).destroy
    if @work.delete
      redirect_to profile_path(tab: :works)
    else 
      render "edit"
    end
  end

  private

  def work_params
    params.require(:work).permit(:code, :name, :address, :zip_code, :city, :state, :country, :client, :client_phone, :client_email)
  end

  def find_work
    @work = Work.get_work(params[:id], current_user)
  end
end
