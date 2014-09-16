class Comment < ActiveRecord::Base
   attr_accessible :report_comments, :report_id
   belongs_to :report
end
