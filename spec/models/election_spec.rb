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

  describe '#tally, #tally_decrypted' do
    let(:election) { FactoryBot.create :election, b: 10 }
    let(:privkey) { election.privkey }
    let(:pubkey) { election.pubkey }

    before do
      FactoryBot.create :candidate, election: election, number: 1, name: 'a'
      FactoryBot.create :candidate, election: election, number: 2, name: 'b'
      FactoryBot.create :candidate, election: election, number: 3, name: 'c'
    end

    subject { election.tally_decrypted }

    context 'a' do
      before do
        [0, 1, 1, 10, 100].each do |m|
          election.votes.create(c: Paillier.encrypt(pubkey, m))
        end
      end

      it { is_expected.to eq 112 }
    end

    context 'b' do
      before do
        [0, 1, 10, 10, 100].each do |m|
          election.votes.create(c: Paillier.encrypt(pubkey, m))
        end
      end

      it { is_expected.to eq 121 }
    end

    context 'c' do
      before do
        [0, 1, 10, 100, 100].each do |m|
          election.votes.create(c: Paillier.encrypt(pubkey, m))
        end
      end

      it { is_expected.to eq 211 }
    end

    context 'no vote' do
      it { is_expected.to eq 0 }
    end
  end

  describe '#result' do
    before do
      @election = FactoryBot.create :election, b: 10
      FactoryBot.create :candidate, election: @election, number: 1, name: 'a'
      FactoryBot.create :candidate, election: @election, number: 2, name: 'b'
      FactoryBot.create :candidate, election: @election, number: 3, name: 'c'
      7.times { @election.votes.create c: Paillier.encrypt(@election.pubkey, 0) }
      6.times { @election.votes.create c: Paillier.encrypt(@election.pubkey, 1) }
      5.times { @election.votes.create c: Paillier.encrypt(@election.pubkey, 10) }
      4.times { @election.votes.create c: Paillier.encrypt(@election.pubkey, 100) }
    end

    it { expect(@election.result).to eq [[1, 6], [2, 5], [3, 4], [0, 7]]  }
  end
end
