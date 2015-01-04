class AddCountryCorpoToContato < ActiveRecord::Migration
  def change
    add_column :contatos, :countrycorpo_country_id, :integer, references: :country
  end
end
