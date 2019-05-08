class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications


def self.first_five
  # limit(5)
  self.first(5)
  #specifies limit for the number of elements to retrieve
end

def self.dinghy
  where("length < 20")
  #returns a new relation which is the result of filtering the current relation according to the condition
end

def self.ship
  where("length > 20")
end

def self.last_three_alphabetically
  self.order(name: :desc).limit(3)
end

def self.without_a_captain
  where(captain: nil)
end

def self.sailboats
  joins(:classifications).where("classifications.name" => "Sailboat")
end

def self.with_three_classifications
  joins(:classifications).group("boats.name").having("count(boat_id) = 3")
end

def self.longest
  order('length DESC').first
end

end
