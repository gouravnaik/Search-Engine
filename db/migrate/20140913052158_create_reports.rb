class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :my_report
      t.text :comment
      t.string :hour_spent
      t.integer :role_id
      t.integer :user_id
      t.boolean :leave, :default => false
      t.timestamps
    end
  end
end
