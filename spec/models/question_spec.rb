require 'rails_helper'

describe Question, type: :model do
  let(:tested) { Question }
  let(:factory) { factory_name(tested) }

  it { expect(build(factory)).to be_valid }

  it { is_expected.to have_many(:answers).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(3) }
  it { is_expected.to validate_length_of(:title).is_at_most(255) }

  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to validate_length_of(:text).is_at_least(3) }
end
