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
    @fix = @work.fixes.create(
      :code => params[:fix][:code],
      :picture => params[:fix][:picture],
      :localization => params[:fix][:localization],
      :comment => params[:fix][:comment],
      :supplier_id => params[:fix][:supplier_id],
      )
    if @fix.save
      redirect_to fix_index_path
    else 
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
