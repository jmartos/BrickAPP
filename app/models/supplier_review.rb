class SupplierReview < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :work

  validates :projected_budget, presence: { message: "is required" }, numericality: { message: "is required" }
  validates :final_budget, presence: { message: "is required" }, numericality: { message: "is required" }
  validates :user_valoration, presence: { message: "is required" }, numericality: { :greater_than => 0, :less_than_or_equal_to => 10, message: "your valoration must be between 0 and 10" }
end
