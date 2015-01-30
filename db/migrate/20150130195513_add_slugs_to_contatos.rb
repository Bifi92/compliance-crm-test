class AddSlugsToContatos < ActiveRecord::Migration
  def change
    add_column :contatos, :slug, :string
    add_index :contatos, :slug, unique: true
  end
end
