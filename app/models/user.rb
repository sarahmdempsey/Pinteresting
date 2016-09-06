class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  	has_many :pins

  	validates :password, :name, 	:presence => true,
                     	:on => :create,
                     	:if => :password,
                     	:format => {:with => /\A.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A=Z])(?=.*[\@\#\$\%\^\&\+\=\!\*]).*\Z/}

    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100$#" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    

end


