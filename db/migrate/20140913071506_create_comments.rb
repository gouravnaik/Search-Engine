class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :report_comments
      t.integer :report_id
      t.timestamps
    end
  end
end
