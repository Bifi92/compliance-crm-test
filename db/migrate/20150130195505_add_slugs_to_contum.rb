class AddSlugsToContum < ActiveRecord::Migration
  def change
    add_column :conta, :slug, :string
    add_index :conta, :slug, unique: true
  end
end
