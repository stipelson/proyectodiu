class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.string :usuario
      t.string :password
      t.string :correo
      t.boolean :admin

      t.timestamps
    end
    add_index :users, :usuario, unique: true
  end
end
