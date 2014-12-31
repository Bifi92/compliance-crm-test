class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.references :country, index: true
      t.string :nome
      t.string :sigla

      t.timestamps null: false
    end
    add_foreign_key :estados, :countries
  end
end
