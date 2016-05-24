class FixesController < ApplicationController

  before_action :require_login
  
  def index
    @work = current_user.works.find(params[:work_id])
    @supplier = current_user.suppliers.all
    @fixes = @work.fixes.order(created_at: :desc)
    @fixes_status = @fixes.pluck(:check)
    @supplier_review = SupplierReview.all
  end

  def check
    @fix = Fix.find(params[:id])
    @fix.update_attribute(:check, @fix.check_status)
    @fix.save
    respond_to do |format|
      format.js{}
    end
  end

  def new
    @work = current_user.works.find(params[:work_id])
    @fix = Fix.new
  end

  def create
    @work = current_user.works.find(params[:work_id])
    @fix = @work.fixes.new(fix_params)
    if @fix.save
      redirect_to fix_index_path
    else 
      render "new"
    end
  end

  def edit
    @work = current_user.works.find(params[:work_id])
    @fix = Fix.find(params[:id])
  end

  def update
    @fix = Fix.find(params[:id]).update(fix_params)
    redirect_to fix_index_path
  end

  def destroy
    @fix = Fix.find(params[:id]).destroy
    if @fix.delete
      redirect_to fix_index_path
    else 
      render "edit"
    end
  end


  private

  def fix_params
    params.require(:fix).permit(:code, :picture, :localization, :comment, :supplier_id)
  end
end