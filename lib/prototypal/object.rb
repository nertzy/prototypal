require "prototypal"

module Prototypal
  class Object
    def initialize(prototype = nil)
      @prototype = prototype
    end

    def respond_to_missing?(name, include_private = false)
      @prototype.respond_to?(name) || super
    end

    def method_missing(name, *args, &block)
      return @prototype.send(name, *args, &block) if respond_to_missing?(name)
      super
    end

    def inspect
      "#<Prototypal::Object @prototype=#{@prototype.inspect}>"
    end
  end
end
