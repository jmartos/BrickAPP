class SupplierReviewsController < ApplicationController

  before_action :require_login

  def new
    @work = current_user.works.find(params[:work_id])
    @suppliers = Supplier.where(id: @work.fixes.pluck(:supplier_id))
    @supplier_review = SupplierReview.new
  end

  def create
    @work = current_user.works.find(params[:work_id])
    @suppliers = Supplier.where(id: @work.fixes.pluck(:supplier_id))
    @suppliers.each do |supplier|
      @supplier_review = supplier.supplier_reviews.new(supplier_review_params)
    end
    if @supplier_review.save
      redirect_to profile_path(tab: :works)
    else 
      render "new"
    end
  end

  private

  def supplier_review_params
    params.require(:supplier_review).permit(:projected_budget, :final_budget, :user_valoration, :work_id)
  end
end
