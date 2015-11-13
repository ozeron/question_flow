class Answer < ActiveRecord::Base
  belongs_to :question

  validates :question_id, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :text, presence: true, length: { minimum: 3 }
end
