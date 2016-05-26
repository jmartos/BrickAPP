require 'rails_helper'

RSpec.describe Work, type: :model do
  describe "test for work model" do
    it "review button empty" do
      work = Work.new
      expect(work.review_button).to eq("empty")
    end
  end
end
