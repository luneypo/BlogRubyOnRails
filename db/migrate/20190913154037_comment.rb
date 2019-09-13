class Comment < ActiveRecord::Migration[6.0]
  def change
    create_table :commentaires
    add_column :commentaires, :title, :string
    add_column :commentaires, :content, :text
    add_column :commentaires, :article_id, :integer
    add_index :commentaires, :article_id
  end
end
