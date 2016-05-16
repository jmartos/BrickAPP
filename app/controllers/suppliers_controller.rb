class SuppliersController < ApplicationController

  def show
    supplier = Supplier.find(params[:id])
    render json: supplier
  end
end
