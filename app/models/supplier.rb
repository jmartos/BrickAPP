class Supplier < ActiveRecord::Base
  belongs_to :user
  has_many :fixes
  has_many :supplier_reviews

  validates :name, presence: { message: "is required" }, uniqueness: { message: "is already used" }
  validates :guild, presence: { message: "is required" }


  def self.get_supplier(id, user)
    user.suppliers.find(id)
  end

  def user_valoration_averege
    if (self.supplier_reviews.pluck(:user_valoration)).inject(:+) == nil
      return "-"
    else
      (self.supplier_reviews.pluck(:user_valoration)).inject(:+)/(self.supplier_reviews.count)
    end
  end

  def budget_valoration
    @overcost = []
    self.supplier_reviews.each do |review|
      ind_overcost = ((((review.final_budget-review.projected_budget)*100)/(review.projected_budget)))
      @overcost.push(ind_overcost)
    end
    return @overcost
  end

  def budget_valoration_averege
    if (self.supplier_reviews.pluck(:final_budget)).inject(:+) == nil
      return "-"
    else 
      ((((self.supplier_reviews.pluck(:final_budget)).inject(:+))-(self.supplier_reviews.pluck(:projected_budget)).inject(:+))*100)/((self.supplier_reviews.pluck(:projected_budget)).inject(:+))
    end
  end
end

# def obtain_chart_data
#   @user_valoration = self.supplier_reviews.pluck(:user_valoration)
#   @overcosts = self.budget_valoration
# end

