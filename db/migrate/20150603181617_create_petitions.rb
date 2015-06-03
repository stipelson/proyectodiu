class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.boolean :encontrado_a
      t.boolean :solicitado_a
      t.references :user, index: true
      t.references :article, index: true
      t.text :razon

      t.timestamps
    end
  end
end
