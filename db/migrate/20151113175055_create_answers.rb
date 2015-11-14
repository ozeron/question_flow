class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.integer :question_id, index: true
      t.timestamps null: false
    end
  end
end
