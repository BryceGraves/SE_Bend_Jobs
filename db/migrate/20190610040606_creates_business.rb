class CreatesBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :business_type, :string
  end
end
