class Generator < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.gen_report(user,start_date,end_date)
     Report.where('user_id = ? AND created_at between ? and ?', user, start_date, end_date )
end
end
