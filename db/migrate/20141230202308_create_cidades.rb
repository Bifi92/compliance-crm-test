class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.references :estado, index: true
      t.string :nome
      t.string :ibge

      t.timestamps null: false
    end
    add_foreign_key :cidades, :estados
  end
end
