class Fix < ActiveRecord::Base
  belongs_to :work
  belongs_to :supplier

  def check (fix)
    if fix.check == true
      fix.check = false
    else
      fix.check = true
    end

  end
end
