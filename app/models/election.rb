class Election < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :votes, dependent: :destroy

  before_validation :set_n_sq

  def set_n_sq
    self.n_sq = self.n ** 2
  end

  def privkey
    Paillier::PrivateKey.new l.to_i, m.to_i
  end

  def pubkey
    Paillier::PublicKey.new n.to_i
  end

  def tally
    sum = 1 # g ** 0
    votes.each do |vote|
      sum = Paillier.eAdd pubkey, sum, vote.c.to_i
    end
    sum
  end

  def tally_decrypted
    Paillier.decrypt(privkey, pubkey, tally).to_i
  end

  def result
    s = tally_decrypted
    a = candidates.map.with_index(1) { |c, i| [i, s % (b.to_i ** i) / (b.to_i ** (i - 1))] }
    a + [[0, votes.count - a.map { |e| e[1] }.sum]]
  end
end
