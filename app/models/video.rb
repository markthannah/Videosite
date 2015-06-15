class Video < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :image

  validates :image, presence: true
  validates :videourl, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :order, numericality: { only_integer: true }
  validates :duration, numericality: { only_integer: true }
  validates_inclusion_of :category, :in => ["testimonial","intro"], message: "must be testimonial or intro"
  end
