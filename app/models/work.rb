class Work < ActiveRecord::Base
  belongs_to :user
  has_many :fixes

  validates :name, presence: { message: "is required" }, uniqueness: { message: "is already used" }
  validates :code, uniqueness: { message: "is already used" }
end
