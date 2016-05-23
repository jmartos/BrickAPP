class SupplierReviewsController < ApplicationController
  def new
    @work = Work.find(params[:work_id])
    @suppliers = Supplier.where(id: @work.fixes.pluck(:supplier_id))
    @supplier_review = SupplierReview.new
  end

  def create
    @work = Work.find(params[:work_id])
    @suppliers = Supplier.where(id: @work.fixes.pluck(:supplier_id))
    @supplier_review = @suppliers.supplier_reviews.create(supplier_review_params)
    if @supplier_review.save
      redirect_to fix_index_path
    else 
      render "new"
    end
  end

  private

  def supplier_review_params
    params.require(:supplier_review).permit(:projected_budget, :final_budget, :user_valoration)
  end
end
