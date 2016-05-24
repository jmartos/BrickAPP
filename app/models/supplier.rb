class Supplier < ActiveRecord::Base
  belongs_to :user
  has_many :fixes
  has_many :supplier_reviews

  validates :name, presence: { message: "is required" }, uniqueness: { message: "is already used" }
  validates :guild, presence: { message: "is required" }

  def user_valoration_averege
    if (self.supplier_reviews.pluck(:user_valoration)).inject(:+) == nil
     return "-"
   else(self.supplier_reviews.pluck(:user_valoration)).inject(:+)/(self.supplier_reviews.count)
   end
 end

 def budget_valoration
  @overcost = []
  self.supplier_reviews.each do |review|
    ind_overcost = (((review.final_budget*100)/(review.projected_budget))-100)
    @overcost.push(ind_overcost)
  end
  return @overcost
end

def budget_valoration_averege
  if (self.supplier_reviews.pluck(:final_budget)).inject(:+) == nil
    return "-"
  else (((self.supplier_reviews.pluck(:final_budget)).inject(:+))*100/(self.supplier_reviews.pluck(:projected_budget)).inject(:+))-100
  end
end
end
