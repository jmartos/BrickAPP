class WorksController < ApplicationController
  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @user = current_user
    @work = @user.works.create(
      :code => params[:work][:code],
      :name => params[:work][:name],
      :address => params[:work][:address],
      :zip_code => params[:work][:zip_code],
      :city => params[:work][:city],
      :state => params[:work][:state],
      :country => params[:work][:country],
      :client => params[:work][:client],
      :client_phone => params[:work][:client_phone],
      :client_email => params[:work][:client_email],
      )
    if @work.save
      redirect_to "/profile"
    else 
      render "new"
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id]).update(
      :code => params[:work][:code],
      :name => params[:work][:name],
      :address => params[:work][:address],
      :zip_code => params[:work][:zip_code],
      :city => params[:work][:city],
      :state => params[:work][:state],
      :country => params[:work][:country],
      :client => params[:work][:client],
      :client_phone => params[:work][:client_phone],
      :client_email => params[:work][:client_email],
      )
    # if @work.save
    redirect_to "/profile"
    # else 
    #   render "edit"
    # end
  end

  def destroy
    @work = Work.find(params[:id]).destroy
    redirect_to "/profile"
  end
end
