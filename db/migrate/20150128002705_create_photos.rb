class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :fid
      t.string :url
      t.string :model
      t.string :lens
      t.string :focal_length
      t.string :max_aperture_value
      t.string :exposure_time
      t.string :iso
      t.string :white_balance
      t.string :f_number
      t.string :flash

      t.timestamps
    end
  end
end
