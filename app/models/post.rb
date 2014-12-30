class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :image, :styles => { :main => "510x510" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
