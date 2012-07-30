class CartesianProduct
  include Enumerable

  def initialize(seq1,seq2)
      @seq1 = seq1
      @seq2 = seq2
  end

  def each
      for i in @seq1
          for j in @seq2
              yield [i,j]
          end
      end
      return
  end
end
