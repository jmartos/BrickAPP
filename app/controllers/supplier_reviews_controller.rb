class SupplierReviewsController < ApplicationController
  def new
    @work = Work.find(params[:work_id])
    @suppliers = Supplier.where(id: @work.fixes.pluck(:supplier_id))

    @supplier_review = SupplierReview.new
  end

  # def create
  #   @user = current_user
  #   @supplier = @user.suppliers.create(
  #     :name => params[:supplier][:name],
  #     :guild => params[:supplier][:guild],
  #     :phone_number_1 => params[:supplier][:phone_number_1],
  #     :phone_number_2 => params[:supplier][:phone_number_2],
  #     :email => params[:supplier][:email],
  #     :address => params[:supplier][:address],
  #     :zip_code => params[:supplier][:zip_code],
  #     :city => params[:supplier][:city],
  #     :state => params[:supplier][:state],
  #     :country => params[:supplier][:country],
  #     )
  #   if @supplier.save
  #     redirect_to "/profile"
  #   else 
  #     render "new"
  #   end
  # end
end
