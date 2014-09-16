class ChangeColumnReports < ActiveRecord::Migration
  def up
  	change_column :reports, :leave, :boolean, :default => 1
  end

  def down
  end
end
