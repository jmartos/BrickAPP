class Work < ActiveRecord::Base
  belongs_to :user
  has_many :fixes
  has_many :supplier_reviews

  validates :name, presence: { message: "is required" }, uniqueness: { message: "is already used" }
  validates :code, uniqueness: { message: "is already used" }
  
  def self.get_work(id, user)
    user.works.find(id)
  end
end

