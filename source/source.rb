require 'securerandom'
class Source
    attr_accessor :id, :name
    attr_reader :items
    def initialize(name)
        @id = SecureRandom.random_number(1000)
        @name = name
        @items = []
    end    
end