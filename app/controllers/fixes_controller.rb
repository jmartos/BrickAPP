class FixesController < ApplicationController

  def index
    @work = Work.find(params[:work_id])
    @fixes = Fix.first
    @fixes = @work.fixes.order(created_at: :desc)
  end

  def check
    @fix = Fix.find(params[:id])
    @fix.check(@fix)
  end


end
