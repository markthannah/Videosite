class Video < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :image
end
