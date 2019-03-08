class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string     :owner
      t.text       :description
      t.string     :image_ref
      t.timestamps
    end
  end
end
