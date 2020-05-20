class AddGithublnkToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :github_link, :string
  end
end
