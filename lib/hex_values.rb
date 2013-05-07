require "hex_values/version"

module HexValuesFromFloat
  MAX_DECIMALS = 14

  def to_hex(precision = MAX_DECIMALS)
    precision = MAX_DECIMALS if precision < 0

    num,dec = get_hex_value(self)
    first = num
    second = ""
    iterations = 0
    while dec > 0 && iterations < precision
      num, dec = get_hex_value(dec*16)
      second << num
      iterations += 1
    end

    if "".eql? second
      first
    else
      "#{first}.#{second}"
    end
  end

  private

  def get_hex_value(float_num)
    base, remainder = float_num.to_s.split('.')
    [base.to_i.to_s(16).upcase, "0.#{remainder}".to_f]
  end
end

module FloatValuesFromString
  def to_float
    number = 0
    base, remainder = self.split('.')

    get_sum(base.split(//).reverse!) { |element, index| number += element.to_i(16) * (16 ** index) } if base
    get_sum(remainder.split(//)) { |element, index| number += element.to_i(16).to_f / (16 ** (index + 1)) } if remainder

    number
  end

  private

  def get_sum(array, &block)
    array.each_index do |index|
      block.call(array[index], index)
    end
  end
end

class Float
  include HexValuesFromFloat
end

class String
  include FloatValuesFromString
end

class Fixnum
  def to_hex(precision=HexValuesFromFloat::MAX_DECIMALS)
    self.to_f.to_hex(precision)
  end
end
