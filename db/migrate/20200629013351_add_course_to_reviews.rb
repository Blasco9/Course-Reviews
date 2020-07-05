class AddCourseToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :course, null: false, foreign_key: true
  end
end
