class CreateCritiques < ActiveRecord::Migration
  def change
    create_table :critiques do |t|
      t.string :fid
      t.integer :author
      t.string :sugg_ap
      t.string :sugg_sh
      t.string :sugg_iso
      t.string :sugg_wb

      t.timestamps
    end
  end
end
