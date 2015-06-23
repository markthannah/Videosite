class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :videos
  has_attached_file :avatar, :styles => {
      :medium => { :geometry => "640x480", :format => 'flv' },
      :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
          }, :processors => [:transcoder]
end
