class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.boolean :red, default: false
      t.boolean :green, default: true
      t.belongs_to :user, null: false, index: true
      t.belongs_to :micropost, null: false
    end
  end
end
