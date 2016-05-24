class SuppliersController < ApplicationController

  before_action :require_login

  def show
    @supplier = current_user.suppliers.find(params[:id])

    @overcosts = @supplier.budget_valoration
    @user_valoration = @supplier.supplier_reviews.pluck(:user_valoration)
    @work_id_reviews = @supplier.supplier_reviews.pluck(:work_id)
    @user_val_avg = @supplier.user_valoration_averege
    @budget_val_avg = @supplier.budget_valoration_averege
  end

  def new
    @supplier = current_user.suppliers.new
  end

  def create
    @supplier = current_user.suppliers.new(supplier_params)
    if @supplier.save
      redirect_to profile_path(tab: :suppliers)
    else 
      render "new"
    end
  end

  def edit
    @supplier = current_user.suppliers.find(params[:id])
  end

  def update
    @supplier = current_user.suppliers.find(params[:id]).update(supplier_params)
    redirect_to profile_path(tab: :suppliers)

  end

  def destroy
    @supplier = current_user.suppliers.find(params[:id]).destroy
    if @supplier.delete
      redirect_to profile_path(tab: :suppliers)
    else 
      render "edit"
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :guild, :phone_number_1, :phone_number_2, :email, :address, :zip_code, :city, :state, :country)
  end

end
