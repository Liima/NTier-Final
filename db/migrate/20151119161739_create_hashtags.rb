class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :hashstring, null: false, unique: true
      t.timestamps null: false
    end
    create_table :hashtags_microposts, id: false do |t|
      t.belongs_to :hashtag, index: true
      t.belongs_to :micropost, index: true
      t.integer :count, default: 0
    end
  end
end
