require "proto/object"

describe Proto::Object do
  describe "#method_missing" do
    it "delegates methods to the prototype when the prototype responds to them" do
      prototype = Object.new
      def prototype.some_method
        "some result"
      end

      object = Proto::Object.new(prototype)

      expect(object.respond_to?(:some_method)).to be_true
      expect(object.some_method).to eql("some result")
    end
  end
end
