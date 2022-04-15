class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.string :author
      t.string :category
      t.date :published_at

      t.timestamps null: false
    end
  end
end
