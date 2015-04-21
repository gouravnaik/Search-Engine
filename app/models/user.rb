class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role_id
  # attr_accessible :title, :body
  belongs_to :role
  has_many :reports
  has_many :blogs

  validates :role_id,  :presence=>  {:message => "Select the Role"}
end
