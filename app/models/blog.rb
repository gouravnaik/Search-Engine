class Blog < ActiveRecord::Base
   attr_accessible :title, :content, :user_id
   belongs_to :user

   include Tire::Model::Search
   include Tire::Model::Callbacks
end
