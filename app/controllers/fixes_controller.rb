class FixesController < ApplicationController

  before_action :require_login
  before_action :find_work, only: [:index, :new, :create, :edit]
  before_action :find_fix, only: [:check, :edit, :update, :destroy]

  def index
    @supplier = current_user.suppliers.all
    @fixes = @work.fixes.order(created_at: :desc)
    @val = @work.review_button
  end

  def check
    @fix.update_attribute(:check, @fix.check_status)
    @fix.save
    respond_to do |format|
      format.js{}
    end
  end

  def new
    @fix = Fix.new
  end

  def create
    @fix = @work.fixes.new(fix_params)
    if @fix.save
      redirect_to fix_index_path
    else 
      render "new"
    end
  end

  def edit
  end

  def update
    @fix.update(fix_params)
    redirect_to fix_index_path
  end

  def destroy
    @fix.destroy
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

  def find_work
    @work = Work.get_work(params[:work_id], current_user)
  end

  def find_fix
    @fix = Fix.get_fix(params[:id])
  end
end