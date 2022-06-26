class CreateAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :analyses do |t|
      t.string :name
      t.string :description
      t.string :files

      t.belongs_to :patient

      t.timestamps
    end
  end
end
