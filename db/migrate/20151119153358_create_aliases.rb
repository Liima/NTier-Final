class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.string :name, unique: true
      t.belongs_to :user, index: true
    end
  end
end
