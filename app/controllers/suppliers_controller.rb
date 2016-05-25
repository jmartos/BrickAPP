class SuppliersController < ApplicationController

  before_action :require_login
  before_action :find_supplier, only: [:show, :edit, :update, :destroy]

  def show
    @data = @supplier.obtain_chart_data
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
  end

  def update
    @supplier.update(supplier_params)
    redirect_to profile_path(tab: :suppliers)

  end

  def destroy
    @supplier.destroy
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

  def find_supplier
    @supplier = Supplier.get_supplier(params[:id], current_user)
  end
end
