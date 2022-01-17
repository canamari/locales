class CreatePropertyImages < ActiveRecord::Migration[5.2]
  def change
    create_table :property_images do |t|
      t.string     :image
      t.belongs_to :property

      t.timestamps
    end
  end
end
