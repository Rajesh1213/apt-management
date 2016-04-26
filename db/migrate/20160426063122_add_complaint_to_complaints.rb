class AddComplaintToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :content, :text
  end
end
