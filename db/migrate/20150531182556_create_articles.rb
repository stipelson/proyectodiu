class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :nombre
      t.string :marca
      t.string :color
      t.text :descripcion
      t.string :lugar
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
