class SupplierReview < ActiveRecord::Base
  belongs_to :supplier

  validates :projected_budget, presence: { message: "is required" }, numericality: { :greater_than => 0, :less_than_or_equal_to => 10, message: "is required" }
  validates :final_budget, presence: { message: "is required" }, numericality: { :greater_than => 0, :less_than_or_equal_to => 10, message: "is required" }
  validates :user_valoration, presence: { message: "is required" }, numericality: { :greater_than => 0, :less_than_or_equal_to => 10, message: "is required" }
end
