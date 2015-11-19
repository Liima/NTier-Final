class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.belongs_to :user, index: true
      t.belongs_to :alias, index: true
      t.timestamps null: false
    end
  end
end
