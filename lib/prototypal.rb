require "prototypal/version"

module Prototypal
  autoload :Object, "prototypal/object"

  def self.new(prototype = nil, &block)
    Prototypal::Object.new(prototype).tap do |object|
      object.instance_eval(&block) if block
    end
  end
end
