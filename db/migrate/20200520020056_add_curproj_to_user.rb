class AddCurprojToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_prj_id, :integer
  end
end
