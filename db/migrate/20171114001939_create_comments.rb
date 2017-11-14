class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :user, foregin_key: true
      t.references :prototype, foregin_key: true
      t.timestamps null: false
    end
  end
end
