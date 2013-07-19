require "proto/version"

module Proto
  autoload :Object, "proto/object"

  def self.new(prototype = nil, &block)
    Proto::Object.new(prototype).tap do |object|
      object.instance_eval(&block) if block
    end
  end
end
