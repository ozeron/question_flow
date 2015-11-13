class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :text, presence: true, length: { minimum: 3 }
end
