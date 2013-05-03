require "hex_values/version"

module HexValuesFromFloat
  def to_hex
    num,dec = get_hex_value(self)
    first = num
    second = ""
    iterations = 0
    while dec > 0 && iterations < 10
      num, dec = get_hex_value(dec*16)
      second << num
      iterations += 1
    end
    "#{first}.#{second}"
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
    arr=[]
    base.each_char { |c| arr << c }
    arr.reverse!.each_index do |index|
      number += arr[index].to_i(16) * (16 ** index)
    end

    arr=[]
    remainder.each_char { |c| arr << c }
    arr.each_index do |index|
      number += arr[index].to_i(16).to_f / (16 ** (index + 1))
    end

    number
  end
end

class Float
  include HexValuesFromFloat
end

class String
  include FloatValuesFromString
end
