class AddSlugsToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :slug, :string
    add_index :leads, :slug, unique: true
  end
end
