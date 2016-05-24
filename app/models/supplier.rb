class Supplier < ActiveRecord::Base
  belongs_to :user
  has_many :fixes
  has_many :supplier_reviews

  validates :name, presence: { message: "is required" }, uniqueness: { message: "is already used" }

  def user_valoration_averege
    (self.supplier_reviews.pluck(:user_valoration)).inject(:+)/(self.supplier_reviews.count)
  end

  def budget_valoration
    ((self.supplier_reviews.pluck(:final_budget)).inject(:+))*100/(self.supplier_reviews.pluck(:projected_budget)).inject(:+)
  end

  def percentage_fixes_valoration

  end
end
