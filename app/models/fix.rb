class Fix < ActiveRecord::Base
  belongs_to :work
  belongs_to :supplier

  validates :code, presence: { message: "is required" }
  validates :supplier_id, presence: { message: "is required" }
  
  has_attached_file :picture, 
  :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
  :url => "/system/:attachment/:id/:basename_:style.:extension",
  :styles => { :medium => "150x150>", :thumb => "100x100>" }

  validates_attachment :picture,
  :size => { :in => 0..10.megabytes },
  :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  def self.get_fix(id)
    Fix.find(id)
  end

  def check_status
    if self.check == true
      self.check = false
    else
      self.check = true
    end
  end
end
