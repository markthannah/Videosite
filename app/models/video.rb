class Video < ActiveRecord::Base
  belongs_to :user

  has_many :customizations
  has_many :custom_pages, :through => :customizations


  has_attached_file :image, :styles => { :small => "200x200", :medium => "400x400>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :image

  validates :image, presence: true
  validates :videourl, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :order, numericality: { only_integer: true }
  validates :duration, numericality: { only_integer: true }
  validates_inclusion_of :category, :in => ["testimonial","intro"], message: "must be testimonial or intro"
  validates_inclusion_of :product, :in => ["netTrekker","icurio 1.0","icurio 2.0"], message: "must be netTrekker, icurio 1.0, or icurio 2.0"

  end
