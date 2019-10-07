class AddProgramFkToCourses < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :programs, null: false, foreign_key: true
  end
end
