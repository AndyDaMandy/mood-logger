class CreateMoods < ActiveRecord::Migration[7.0]
  def change
    create_table :moods do |t|
      t.string :vibe
      t.string :health
      t.string :productivity
      t.string :fun
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
