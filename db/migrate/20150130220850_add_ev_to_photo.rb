class AddEvToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :ev, :string
  end
end
