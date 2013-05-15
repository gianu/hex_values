class Hexadecimal
  MAX_DECIMALS = 14

  def initialize(float_representation=0.0, precision=MAX_DECIMALS)
    precision = MAX_DECIMALS if precision.nil? || precision < 0
    @max_decimals=precision
    @float_representation=float_representation
  end

  # Public: return the float value of the Hexadecimal.
  #
  # Returns the Float value of the Hexadecimal.
  def to_float
    @float_representation
  end

  # Public: return a String representation.
  #
  # Returns a String representation of the Hexadecimal object.
  def to_s
    return "Infinity" unless @float_representation.to_f.infinite?.nil?
    num,dec = get_hex_value(@float_representation)
    first = num
    second = ""
    iterations = 0
    while dec > 0 && iterations < @max_decimals
      num, dec = get_hex_value(dec*16)
      second << num
      iterations += 1
    end

    if "".eql? second
      first
    else
      normalize_negativity "#{first}.#{second}", @float_representation
    end
  end

  # Public: Sum two values.
  #
  # other_obj - An Hexadecimal object, a Fixnum or a Float
  #
  # Returns an Hexadecimal object, sum of the two objects.
  def +(other_obj)
    if other_obj.instance_of? Hexadecimal
      float_result = self.to_float + other_obj.to_float
      max_precision = (self.max_decimals > other_obj.max_decimals) ? self.max_decimals : other_obj.max_decimals
    else
      float_result = self.to_float + other_obj
      max_precision = self.max_decimals
    end

    Hexadecimal.new(float_result, max_precision)
  end

  # Public: Substracts two values.
  #
  # other_obj - An Hexadecimal object, a Fixnum or a Float
  #
  # Returns an Hexadecimal object, the substaction of the second object over the first.
  def -(other_obj)
    self + (other_obj * -1)
  end


  # Public: Multiply two values.
  #
  # other_obj - An Hexadecimal object, a Fixnum or a Float
  #
  # Returns an Hexadecimal object, the multiplication of the operands.
  def *(other_obj)
    if other_obj.instance_of? Hexadecimal
      float_result = self.to_float * other_obj.to_float
      max_precision = (self.max_decimals > other_obj.max_decimals) ? self.max_decimals : other_obj.max_decimals
    else
      float_result = self.to_float * other_obj
      max_precision = self.max_decimals
    end

    Hexadecimal.new(float_result, max_precision)
  end

  # Public: Divide two values.
  #
  # other_obj - An Hexadecimal object, a Fixnum or a Float
  #
  # Returns an Hexadecimal object, the division of the operands.
  def /(other_obj)
    if other_obj.instance_of? Hexadecimal
      float_result = self.to_float / other_obj.to_float
      max_precision = (self.max_decimals > other_obj.max_decimals) ? self.max_decimals : other_obj.max_decimals
    else
      float_result = self.to_float / other_obj
      max_precision = self.max_decimals
    end

    Hexadecimal.new(float_result, max_precision)
  end

  # Public: Pow two values.
  #
  # other_obj - An Hexadecimal object, a Fixnum or a Float
  #
  # Returns an Hexadecimal object, the power of the operands.
  def **(other_obj)
    if other_obj.instance_of? Hexadecimal
      float_result = self.to_float ** other_obj.to_float
      max_precision = (self.max_decimals > other_obj.max_decimals) ? self.max_decimals : other_obj.max_decimals
    else
      float_result = self.to_float ** other_obj
      max_precision = self.max_decimals
    end

    Hexadecimal.new(float_result, max_precision)
  end

  # Public: Transform a given string into a Hexadecimal object.
  #
  # hex_representation - A String representing a Hexadecimal value
  #
  # Examples:
  #   Hexadecimal.from_string("EA.4")
  #
  # Returns an Hexadecimal object. Or throws an exception if the string can't be parsed.
  def self.from_string(hex_representation)
    return Hexadecimal.new if hex_representation.nil?
    Hexadecimal.new(hex_representation.to_float)
  end

  protected

  def max_decimals
    @max_decimals
  end

  private

  def get_hex_value(float_num)
    base, remainder = float_num.to_s.split('.')
    [base.to_i.to_s(16).upcase, "0.#{remainder}".to_f]
  end

  def normalize_negativity(string, float_num)
    if string[0] != "-" && float_num < 0
      "-#{string}"
    else
      string
    end
  end

end
