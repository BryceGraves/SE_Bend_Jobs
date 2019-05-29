class CreatesJob < ActiveRecord::Migration[5.2]
  def change
    change_column :jobs, :pay, :float
  end
end
