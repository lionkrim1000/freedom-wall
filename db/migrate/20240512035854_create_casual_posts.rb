class CreateCasualPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :casual_posts do |t|
        t.string :name
        t.text :content
        t.date :date_posted
        t.timestamps
      end
  end
end
