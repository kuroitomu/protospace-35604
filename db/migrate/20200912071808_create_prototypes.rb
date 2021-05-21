class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string         :title,            null:      false
      t.text           :catch_copy,       null:      false
      t.text           :concept,          null:      false
      t.active_storage,                   null:      false
      t.references     :user,                        foreign_key: true
      
      t.timestamps
      add_foreign_key :tweets, :users, foreign_key: true
    end
  end
end
