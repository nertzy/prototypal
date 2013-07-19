require "proto"

describe Proto do
  describe ".new" do
    it "can be extended in a block" do
      proto = Proto.new do |p|
        def some_method
          "some result"
        end
      end

      expect(proto.some_method).to eql("some result")
    end

    it "accepts a prototype object and returns a new object with the same methods as its prototype" do
      proto = Proto.new do
        def some_method
          "some result"
        end
      end

      obj = Proto.new(proto)

      expect(obj).not_to equal(proto)
      expect(obj.some_method).to eql("some result")
    end
  end
end
