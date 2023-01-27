class Sale < ApplicationRecord

  def self.active
    self.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).any?
  end

  def finished?
    # The self. here is unnecessary (as seen in future methods), but I've kept it for my future reference
    self.ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
