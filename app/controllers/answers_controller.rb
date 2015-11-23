class AnswersController < ApplicationController
  before_filter :load_question

  def create
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def update
    @answer = @question.answers.find_by_id(params[:id])
    @answer.update_attributes(answer_params)
    redirect_to question_path(@question)
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:title, :text)
  end
end
