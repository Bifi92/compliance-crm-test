class AddCountryCobrToConta < ActiveRecord::Migration
  def change
    add_column :conta, :countrycobr_country_id, :integer, references: :country
  end
end
