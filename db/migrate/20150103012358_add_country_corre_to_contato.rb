class AddCountryCorreToContato < ActiveRecord::Migration
  def change
    add_column :contatos, :countrycorre_country_id, :integer, references: :country
  end
end
