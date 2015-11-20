require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }
  let(:answer) { create(:answer, question_id: question.id) }
  let(:attributes) { attributes_for(:answer) }

  describe 'POST create' do
    it 'assings @question Question found by question_id' do
      post :create, answer: attributes, question_id: question
      expect(assigns(:question)).to eq(question)
    end

    context 'with valid attributes' do
      it 'saves new record in database' do
        expect { post :create, answer: attributes, question_id: question }.to change(Answer, :count).by(1)
      end

      it 'new answer change question answers count by one' do
        post :create, answer: attributes, question_id: question
        question.reload
        expect(question.answers.size).to eq(1)
      end

      it 'redirect to question#show' do
        post :create, answer: attributes, question_id: question
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'with invalid attributes' do
      let(:attributes) { attributes_for(:invalid_answer) }

      it 'not saves new record in database' do
        expect { post :create, answer: attributes, question_id: question }.to_not change(Answer, :count)
      end

      it 'redirect to question#show' do
        post :create, answer: attributes, question_id: question
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end
  end

  describe 'POST update' do
    it 'assings @question Question found by question_id' do
      post :update, answer: attributes, question_id: question, id: answer
      expect(assigns(:question)).to eq(question)
    end

    it 'assings @answer Answer found by id' do
      post :update, answer: attributes, question_id: question, id: answer
      expect(assigns(:answer)).to eq(answer)
    end

    context 'with valid attributes' do
      it 'update answer fields' do
        post :update, answer: attributes, question_id: question, id: answer.id
        answer.reload
        expect(answer.text).to eq(attributes[:text])
        expect(answer.title).to eq(attributes[:title])
      end

      it 'redirect to question#show' do
        post :create, answer: attributes, question_id: question, id: answer
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'with invalid attributes' do
      let(:attributes) { attributes_for(:invalid_answer) }

      it 'not change fields' do
        post :update, answer: attributes, question_id: question, id: answer
        answer.reload
        expect(answer.text).to_not eq(attributes[:text])
        expect(answer.title).to_not eq(attributes[:title])
      end

      it 'redirect to question#show' do
        post :create, answer: attributes, question_id: question, id: answer
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end
  end
end
