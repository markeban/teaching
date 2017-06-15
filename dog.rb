require 'rspec'

class Animal
  protected

  def wag_tail
    puts "tail is wagging!"
  end

  def self.all
    puts "getting all the animals....."
  end

end

module Jaw

  def bite
    "ouch!"
  end
    
end


class Dog < Animal
  include Jaw

  attr_accessor :color
  
  def initialize(dog_hash)
    @color = dog_hash[:color]
    @breed = dog_hash[:breed]
    wag_tail
  end

  def shed
    "lose hair!!"
  end
end

RSpec.describe Dog do
  describe "#shed" do
    it "should output 'lose hair'" do
      dog = Dog.new({:color => "pink", :breed =>"poodie"})
      expect(dog.shed).to eq("lose hair!!")
    end
  end

end

