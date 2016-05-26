require 'rails_helper'

RSpec.describe Fix, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "turn fix to done" do
    it "change check column from false to true" do
      expect(Fix.new.check_status).to eq(true)
    end
  end
end
