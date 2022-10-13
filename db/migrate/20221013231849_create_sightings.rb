class CreateSightings < ActiveRecord::Migration[7.0]
  def change
    create_table :sightings do |t|
      t.integer :animal_id
      t.decimal :latitude
      t.decimal :longitude
      t.date :date

      t.timestamps
    end
  end
end
