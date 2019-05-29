class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :business, foreign_key: true
      t.string :title
      t.string :description
      t.integer :pay
      t.boolean :available
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
