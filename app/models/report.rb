class Report < ActiveRecord::Base
   attr_accessible :my_report,:comment,:hour_spent,:user_id,:leave
   belongs_to :user
   has_many :comments
end
