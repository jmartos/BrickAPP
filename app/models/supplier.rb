class Supplier < ActiveRecord::Base
  belongs_to :user
  has_many :fixes
  has_many :supplier_reviews

  validates :name, presence: { message: "is required" }, uniqueness: { message: "is already used" }
  validates :guild, presence: { message: "is required" }


  def self.get_supplier(id, user)
    user.suppliers.find(id)
  end

  def self.get_suppliers_for_fix(suppliers, work)
    suppliers.where(id: work.fixes.pluck(:supplier_id))
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

  def obtain_chart_data
    user_valoration = self.supplier_reviews.pluck(:user_valoration)
    overcosts = self.budget_valoration
    work_id_reviews = self.supplier_reviews.pluck(:work_id)
    @data = {
      user_valoration: user_valoration,
      overcosts: overcosts,
      work_id_reviews: work_id_reviews
    }
    return @data
  end
end

