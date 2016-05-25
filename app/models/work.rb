class Work < ActiveRecord::Base
  belongs_to :user
  has_many :fixes
  has_many :supplier_reviews

  validates :name, presence: { message: "is required" }, uniqueness: { message: "is already used" }
  validates :code, uniqueness: { message: "is already used" }
  
  def self.get_work(id, user)
    user.works.find(id)
  end

  def review_button
    @fixes_status = self.fixes.pluck(:check)
    @supplier_review = SupplierReview.all
    if @fixes_status.all? { |item| item == true }
      @val = "button"
    elsif self.fixes == []
      @val = "empty"
    else @supplier_review.any? { |review| review.work_id == self.id }
      @val = "done"
    end
    return @val
  end
end

