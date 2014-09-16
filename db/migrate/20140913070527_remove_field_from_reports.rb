class RemoveFieldFromReports < ActiveRecord::Migration
  def up
  	 remove_column :reports, :role_id
  end

  def down
  end
end
