class Blog < ActiveRecord::Base
   attr_accessible :title, :content, :user_id
   belongs_to :user

   searchable do
    text :title, :boost => 8 
    text :content, :publish_month
    time :created_at
    string :publish_month
    integer :user_id, :references => User
    text :user do
      user.name
    end
   end

   def publish_month
    created_at.strftime("%B %Y")
   end

end
