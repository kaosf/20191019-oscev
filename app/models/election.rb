class Election < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :votes, dependent: :destroy

  before_validation :set_n_sq

  def set_n_sq
    self.n_sq = self.n ** 2
  end
end
