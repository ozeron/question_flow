require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:question) { create(:question) }
  describe 'GET #index' do
    let(:questions) { create_list(:question, 2) }

    before { get :index }

    it 'assigns @questions to all questions' do
      expect(assigns(:questions)).to match_array(questions)
    end

    it { expect(response).to render_template :index }
  end

  describe 'GET #show' do
    before { get :show, id: question }

    it 'assigns question to @question found by id' do
      expect(assigns(:question)).to eq(question)
    end

    it { expect(response).to render_template :show }
  end

  describe 'GET #new' do
    before { get :new }

    it 'assings new question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end

    it { expect(response).to render_template :new }
  end

  describe 'GET #edit' do
    before { get :edit, id: question }

    it 'assigns question to @question found by id' do
      expect(assigns(:question)).to eq(question)
    end

    it { expect(response).to render_template :edit }
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves new record in database' do
        expect { post :create, question: attributes_for(:question) }.to change(Question, :count).by(1)
      end

      it 'redirect to show' do
        post :create, question: attributes_for(:question)
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'with invalid attributes' do
      it 'not saves new record in database' do
        expect { post :create, question: attributes_for(:invalid_question) }.to_not change(Question, :count)
      end

      it 'render new' do
        post :create, question: attributes_for(:invalid_question)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH update' do
    context 'with valid attributes' do
      let(:attributes) { attributes_for(:question) }
      it 'assigns the requested question to @question' do
        patch :update, id: question, question: attributes
        expect(assigns(:question)).to eq(question)
      end

      it 'change question attributes' do
        patch :update, id: question, question: attributes
        question.reload
        expect(question.title).to eq(attributes[:title])
        expect(question.text).to eq(attributes[:text])
      end

      it 'redirect to the updated question' do
        patch :update, id: question, question: attributes_for(:question)
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'with invalid attributes' do
      let(:attributes) { attributes_for(:invalid_question) }

      it 'assigns the requested question to @question' do
        patch :update, id: question, question: attributes
        expect(assigns(:question)).to eq(question)
      end

      it 'not to change question attributes' do
        patch :update, id: question, question: attributes
        question.reload
        expect(question.title).to_not eq(attributes[:title])
        expect(question.text).to_not eq(attributes[:text])
      end

      it 'render edit' do
        patch :update, id: question, question: attributes
        expect(response).to render_template :edit
      end
    end
  end
end
