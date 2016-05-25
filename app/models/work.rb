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
    if @supplier_review.any? { |review| review.work_id == self.id }
      @val = "done"
    elsif @fixes_status.size == 0
      @val = "empty"
    elsif @fixes_status.all? { |item| item == true }
      @val = "button"
    else
      @val = "empty"
    end
    return @val
  end
end

