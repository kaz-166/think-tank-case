class AddQiitalinkToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :qiita_link, :string
  end
end
