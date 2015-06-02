class AddBuscaToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :busca, :boolean
  end
end
