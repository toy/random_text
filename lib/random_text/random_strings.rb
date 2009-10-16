class RandomText
  class RandomStrings < Array
    def get(count = nil)
      case count
      when :all
        to_a.sort_by{ Kernel.rand }
      when Integer
        Array.new(count){ rand }
      else
        rand
      end
    end

    def uniq(count)
      case count
      when :all
        get(:all)
      when Integer
        raise "Dictionary has only #{length} elements (you asked for n)" if count > length
        get(:all).slice(0, count)
      end
    end

    def rand
      self[Kernel.rand(length)]
    end
  end
end
