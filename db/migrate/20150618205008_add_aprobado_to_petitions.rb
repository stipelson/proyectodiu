class AddAprobadoToPetitions < ActiveRecord::Migration
  def change
    add_column :petitions, :aprobado, :boolean
  end
end
