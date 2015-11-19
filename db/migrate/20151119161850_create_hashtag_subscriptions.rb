class CreateHashtagSubscriptions < ActiveRecord::Migration
  def change
    create_table :hashtag_subscriptions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :hashtag, index: true
      t.timestamps null: false
    end
  end
end
