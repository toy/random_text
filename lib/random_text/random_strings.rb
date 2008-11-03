module RandomText
  class RandomStrings < Array
    def get(count = nil)
      count ? Array.new(count){ rand } : rand
    end

    def uniq(n)
      raise "Dictionary has only #{length} elements (you asked for n)" if n > length
      sort_by{ Kernel.rand }.slice(0, n)
    end
  end
end
