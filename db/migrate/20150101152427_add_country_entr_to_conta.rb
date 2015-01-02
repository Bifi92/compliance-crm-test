class AddCountryEntrToConta < ActiveRecord::Migration
  def change
    add_column :conta, :countryentr_country_id, :integer, references: :country
  end
end
