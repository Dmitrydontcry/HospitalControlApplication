class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.binary :data
      t.belongs_to :analysis, foreign_key: true

      t.timestamps
    end
  end
end
