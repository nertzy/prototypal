require "prototypal/object"

describe Prototypal::Object do
  describe "#method_missing" do
    it "delegates methods to the prototype when the prototype responds to them" do
      prototype = Object.new
      def prototype.some_method
        "some result"
      end

      object = Prototypal::Object.new(prototype)

      expect(object.respond_to?(:some_method)).to be_true
      expect(object.some_method).to eql("some result")
    end

    it "doesn't allow you to call the prototype's private methods directly" do
      prototype = Object.new
      class << prototype
        private
        def some_method
          "some result"
        end
      end

      object = Prototypal::Object.new(prototype)

      expect(object.respond_to?(:some_method)).to be_false
      expect(object.respond_to?(:some_method, true)).to be_true
      expect { object.some_method }.to raise_exception
      expect(object.send(:some_method)).to eql("some result")
    end
  end
end
