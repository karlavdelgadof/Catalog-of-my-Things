require 'securerandom'

class Source
    attr_accessor :id, :name
    attr_reader :items

    def initialize(name)
        @id = SecureRandom.random_number(1000)
        @name = name
        @items = []
    end
    
    def add_item(item)
        @items << item unless @items.include?(item)
        item.source = self
    end

    def self.list_all_sources(sources)
        sources each do |source|
            puts "- Name: #{source.name}"
        end
    end
end