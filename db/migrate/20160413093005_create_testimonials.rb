class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.date :date_entered
      t.text :content
      t.belongs_to :rental, index: true

      t.timestamps null: false
    end
  end
end
