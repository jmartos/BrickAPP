class SupplierReviewsController < ApplicationController

  before_action :require_login
  before_action :find_work, only: [:new, :create]
  before_action :find_supplier_for_fix, only: [:new, :create]

  def new
    @supplier_review = SupplierReview.new
  end

  def create
    @suppliers.each do |supplier|
      supplier.supplier_reviews.create(supplier_review_params)
      BrickappMailer.review_email(@work).deliver_now
    end
    redirect_to profile_path(tab: :works)
  end

  private

  def supplier_review_params
    params.require(:supplier_review).permit(:projected_budget, :final_budget, :user_valoration, :work_id)
  end

  def find_work
    @work = Work.get_work(params[:work_id], current_user)
  end

  def find_supplier_for_fix
    @suppliers = Supplier.get_suppliers_for_fix(current_user.suppliers, @work)
  end
end
