class CreateChirps < ActiveRecord::Migration[7.0]
  def change
    create_table :chirps do |t|
      t.text :text
      t.text :author

      t.timestamps
    end
  end
end
