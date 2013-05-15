require "hex_values/version"
require "hex_values/hexadecimal"

module HexValuesFromFloat
  def to_hex(precision=nil)
    Hexadecimal.new(self, precision)
  end
end

module FloatValuesFromString
  def to_float
    negative = false
    str = self

    if self[0].eql? "-"
      negative = true
      str = self[1..self.length]
    end

    number = 0
    base, remainder = self.split('.')

    get_sum(base.split(//).reverse!) { |element, index| number += element.to_i(16) * (16 ** index) } if base
    get_sum(remainder.split(//)) { |element, index| number += element.to_i(16).to_f / (16 ** (index + 1)) } if remainder

    number = number * -1 if negative

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

  alias :old_sum :+
  alias :old_min :-
  alias :old_multiply :*
  alias :old_divide :/
  alias :old_pow :**

  def +(other_obj)
    return other_obj + self if other_obj.instance_of? Hexadecimal
    return old_sum(other_obj)
  end

  def -(other_obj)
    return self.to_hex - other_obj if other_obj.instance_of? Hexadecimal
    return old_min(other_obj)
  end

  def *(other_obj)
    return other_obj * self if other_obj.instance_of? Hexadecimal
    return old_multiply(other_obj)
  end

  def /(other_obj)
    return self.to_hex / other_obj if other_obj.instance_of? Hexadecimal
    return old_divide(other_obj)
  end

  def **(other_obj)
    return self ** other_obj.to_float if other_obj.instance_of? Hexadecimal
    return old_pow(other_obj)
  end
end

class String
  include FloatValuesFromString
end

class Fixnum
  alias :old_sum :+
  alias :old_min :-
  alias :old_multiply :*
  alias :old_divide :/
  alias :old_pow :**

  def to_hex(precision=Hexadecimal::MAX_DECIMALS)
    self.to_f.to_hex(precision)
  end

  def +(other_obj)
    return other_obj + self if other_obj.instance_of? Hexadecimal
    return old_sum(other_obj)
  end

  def -(other_obj)
    return self.to_hex - other_obj if other_obj.instance_of? Hexadecimal
    return old_min(other_obj)
  end

  def *(other_obj)
    return other_obj * self if other_obj.instance_of? Hexadecimal
    return old_multiply(other_obj)
  end

  def /(other_obj)
    return self.to_hex / other_obj if other_obj.instance_of? Hexadecimal
    return old_divide(other_obj)
  end

  def **(other_obj)
    return self ** other_obj.to_float if other_obj.instance_of? Hexadecimal
    return old_pow(other_obj)
  end
end

class NilClass
  def to_hex(precision=Hexadecimal::MAX_DECIMALS)
    Hexadecimal.new(0, precision)
  end
end
