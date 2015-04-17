class ChangeColumnReports < ActiveRecord::Migration
  def up
  	change_column :reports, :leave, :boolean
  end

  def down
  end
end
