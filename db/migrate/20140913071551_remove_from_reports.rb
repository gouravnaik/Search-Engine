class RemoveFromReports < ActiveRecord::Migration
  def up
  	remove_column :reports, :comment
  end

  def down
  end
end
