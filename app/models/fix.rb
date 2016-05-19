class Fix < ActiveRecord::Base
  belongs_to :work
  belongs_to :supplier

  def check_status
    if self.check == true
      self.check = false
    else
      self.check = true
    end
  end
end
