class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    t.references :user, foreigrn_key: true
    t.references :prototype, foreigrn_key: true
    t.timestamps 
    end
  end
end
