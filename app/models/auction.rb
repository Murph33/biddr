class Auction < ActiveRecord::Base

  after_initialize :set_default

  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :details, presence: true
  validates :ends_on, presence: true
  validates :reserve_price, presence: true

  private

  def set_default
    self.current_price ||= 0
  end

end
