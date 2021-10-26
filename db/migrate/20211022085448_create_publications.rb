class CreatePublications < ActiveRecord::Migration[6.1]
  def change
    create_table :publications do |t|

      t.string :image
      t.boolean :active
      t.belongs_to :user, foreign_key: true
      
      t.timestamps
    end
  end
end
