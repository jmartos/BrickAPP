class FixesController < ApplicationController

  def index
    @work = Work.find(params[:work_id])
    @supplier = Supplier.all
    @fixes = Fix.first
    @fixes = @work.fixes.order(created_at: :desc)
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
    @work = Work.find(params[:work_id])
    @fix = Fix.new
  end

  def create
    @work = Work.find(params[:work_id])
    @fix = @work.fixes.create(fix_params)
    if @fix.save
      redirect_to fix_index_path
    else 
      render "new"
    end
  end

  def edit
   @work = Work.find(params[:work_id])
   @fix = Fix.find(params[:id])
 end

 def update
  @fix = Fix.find(params[:id]).update(fix_params)
  if @work.save
    redirect_to fix_index_path
  else 
    render "edit"
  end
end

def destroy
  @fix = Fix.find(params[:id]).destroy
  # redirect_to fix_index_path
end


private

def fix_params
  params.require(:fix).permit(:code, :picture, :localization, :comment, :supplier_id)
end
end