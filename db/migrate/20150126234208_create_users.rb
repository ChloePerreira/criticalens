class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fid
      t.string :avatar
      t.string :level
      t.string :name

      t.timestamps
    end
  end
end
