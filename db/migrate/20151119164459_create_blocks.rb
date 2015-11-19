class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.belongs_to :user, null: false
      t.belongs_to :micropost, null: false
      t.boolean :alias, default: false
      t.timestamps null: false
    end
  end
end
