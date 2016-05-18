class FixesController < ApplicationController

  def index
    @fixes = Fix.all
  end

end
