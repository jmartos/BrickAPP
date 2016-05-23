class Supplier < ActiveRecord::Base
  belongs_to :user
  has_many :fixes
  has_many :supplier_reviews
end
