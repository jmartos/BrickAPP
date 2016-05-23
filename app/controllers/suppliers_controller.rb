class SuppliersController < ApplicationController
  
  before_action :require_login

  def show
    @supplier = Supplier.find(params[:id])
    @user_val = @supplier.user_valoration_averege
    @budget_val = @supplier.budget_valoration
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @user = current_user
    @supplier = @user.suppliers.create(
      :name => params[:supplier][:name],
      :guild => params[:supplier][:guild],
      :phone_number_1 => params[:supplier][:phone_number_1],
      :phone_number_2 => params[:supplier][:phone_number_2],
      :email => params[:supplier][:email],
      :address => params[:supplier][:address],
      :zip_code => params[:supplier][:zip_code],
      :city => params[:supplier][:city],
      :state => params[:supplier][:state],
      :country => params[:supplier][:country],
      )
    if @supplier.save
      redirect_to "/profile"
    else 
      render "new"
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id]).update(
      :name => params[:supplier][:name],
      :guild => params[:supplier][:guild],
      :phone_number_1 => params[:supplier][:phone_number_1],
      :phone_number_2 => params[:supplier][:phone_number_2],
      :email => params[:supplier][:email],
      :address => params[:supplier][:address],
      :zip_code => params[:supplier][:zip_code],
      :city => params[:supplier][:city],
      :state => params[:supplier][:state],
      :country => params[:supplier][:country],
      )
    # if @work.save
    redirect_to "/profile"
    # else 
    #   render "edit"
    # end
  end

  def destroy
    @supplier = Supplier.find(params[:id]).destroy
    redirect_to "/profile"
  end

end
