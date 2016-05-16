class WorksController < ApplicationController
  def show
    work = Work.find(params[:id])
    render json: work
  end
end
