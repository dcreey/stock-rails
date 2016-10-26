class Company < ActiveRecord::Base
  belongs_to :exchange
  validates :name, presence: true
  validates :symbol, presence: true

  def self.get_by_id(id)
    find_by(id: id)
  end

  def self.get_all(name)
    if name
      where('lower(name) LIKE ?', "%#{name.downcase}%")
    else
      all
    end
  end

  # def self.get_history(symbol)
  #   if symbol
  #     where('lower(name) LIKE ?', "%#{name.downcase}%")
  #   else
  #     nil
  #   end
  # end
end