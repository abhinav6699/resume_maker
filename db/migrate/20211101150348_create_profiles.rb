class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :job_title
      t.string :total_experience
      t.string :career_highlights, array: true
      t.text :overview
      t.string :primary_skills, array: true
      t.string :secondary_skills, array: true
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
