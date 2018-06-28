module Printable
  extend ActiveSupport::Concern

  def method 
    puts "DSdsaads"
  end
 
  module ClassMethods
    def method_up
      puts "DSdsaads"
    end
  end

end