require 'rails_helper'

RSpec.describe Election, type: :model do
  describe '#set_n_sq' do
    let(:election) { FactoryBot.build :election, n_sq: nil }

    it do
      election.set_n_sq
      expect(election.n_sq).to eq(election.n ** 2)
    end
  end

  describe 'before_validation :set_n_sq' do
    let(:election) { FactoryBot.build :election }
    before { expect(election).to receive(:set_n_sq) }
    it { election.valid? }
    it { election.save }
    it { election.update b: 10 }
  end
end
