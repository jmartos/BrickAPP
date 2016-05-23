require 'rails_helper'

RSpec.describe SupplierReview, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "calculate valorations for suppliers" do
    it "calculate the % of budget´s desviation" do
      test = SupplierReview.new 
      test.final_budget = 1
      test.projected_budget = 100
      expect(test.budget_valoration).to eq(1.0)
    end
  end
end

