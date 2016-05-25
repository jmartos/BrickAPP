class WorksController < ApplicationController

  before_action :require_login
  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def show
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
  end

  def update
    @work.update(work_params)
    redirect_to profile_path(tab: :works)
  end

  def destroy
    @work.destroy
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
