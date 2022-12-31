class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :body, null: false, default: ""
      t.references :project, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
