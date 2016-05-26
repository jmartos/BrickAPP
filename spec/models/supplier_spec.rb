require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe "test for supplier model" do
    it "user_valoration_averege" do
      supplier = Supplier.new
      supplier.supplier_reviews.new
      supplier.supplier_reviews.new
      expect(supplier.user_valoration_averege).to eq("-")
    end

    it "user_valoration_averege" do
      supplier = Supplier.new
      supplier.supplier_reviews.new(user_valoration: 2)
      supplier.supplier_reviews.new(user_valoration: 8)
      expect(supplier.user_valoration_averege).to eq(5)
    end

    it "budget_valoration" do
      supplier = Supplier.new
      supplier.supplier_reviews.new(final_budget: 120, projected_budget: 100)
      expect(supplier.budget_valoration).to eq([20])
    end
  end
end
