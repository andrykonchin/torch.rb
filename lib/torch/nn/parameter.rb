module Torch
  module NN
    class Parameter < Tensor
      def self.new(data = nil, requires_grad: true)
        data = Tensor.new unless data
        _make_subclass(data, requires_grad)
      end

      def inspect
        "Parameter containing:\n#{super}"
      end

      def dup
        Torch.no_grad do
          Parameter.new(clone, requires_grad: requires_grad)
        end
      end
    end
  end
end
