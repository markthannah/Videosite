class CustomPage < ActiveRecord::Base
  belongs_to :user

  has_many :customizations
  has_many :videos, :through => :customizations

  validates :greeting, presence: true
  validates :message, presence: true
  validates :recipient, presence: true
end
