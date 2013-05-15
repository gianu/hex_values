require 'spec_helper'

describe Hexadecimal do
  describe "from_string" do
    it "transform a string into an Hexadecimal object" do
      hex = Hexadecimal.from_string("EA.4")
      hex.to_s.must_equal "EA.4"
      hex.to_float.must_equal 234.25
    end

    it "transform an empty string into an Hexadecimal object with value 0" do
      hex = Hexadecimal.from_string("")
      hex.to_s.must_equal "0"
      hex.to_float.must_equal 0.0
    end

    it "transform a negative hex string into an Hexadecimal object" do
      hex = Hexadecimal.from_string("-EA.4")
      hex.to_s.must_equal "-EA.4"
      hex.to_float.must_equal -234.25
    end

    it "transform a nil into 0" do
      hex = Hexadecimal.from_string(nil)
      hex.to_s.must_equal "0"
      hex.to_float.must_equal 0.0
    end

    it "transform a nil into 0 (nil as a object)" do
      hex = nil.to_hex

      hex.to_s.must_equal "0"
      hex.to_float.must_equal 0.0
    end

    it "transform a no parseable string into 0" do
      hex = Hexadecimal.from_string("ZZZZzz")

      hex.to_s.must_equal "0"
      hex.to_float.must_equal 0.0
    end
  end

  describe "plus" do
    it "sum two positive hexadecimals objects" do
      hex1 = Hexadecimal.from_string "EA.4"
      hex2 = Hexadecimal.from_string "EA.4"

      result = hex1 + hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 468.5
      result.to_s.must_equal "1D4.8"
    end

    it "sum one hexadecimal object with a float" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 + 234.25

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 468.5
      result.to_s.must_equal "1D4.8"
    end

    it "sum one float with an hexadecimal object" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = 234.25 + hex1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 468.5
      result.to_s.must_equal "1D4.8"
    end

    it "sum two floats (check that + is not broken)" do
      result = 234.25 + 234.25

      result.must_equal 468.5
    end

    it "sum one hexadecimal object with an integer" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 + 234

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 468.25
      result.to_s.must_equal "1D4.4"
    end

    it "sum one integer with an hexadecimal object" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = 234 + hex1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 468.25
      result.to_s.must_equal "1D4.4"
    end

    it "sum two integer (check that + is not broken)" do
      result = 234 + 234

      result.must_equal 468
    end

    it "sum one positive hexadecimal object and one negative hexadecimal object" do
      hex1 = Hexadecimal.from_string "EA.4"
      hex2 = Hexadecimal.from_string "-EA.4"

      result = hex1 + hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 0.0
      result.to_s.must_equal "0"
    end
  end

  describe "minus" do
    it "substracts two positive hexadecimals objects" do
      hex1 = Hexadecimal.from_string "EA.4"
      hex2 = Hexadecimal.from_string "EA.4"

      result = hex1 - hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 0.0
      result.to_s.must_equal "0"
    end

    it "substracts one hexadecimal object with a float" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 - 234.25

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 0.0
      result.to_s.must_equal "0"
    end

    it "substracts one float with an hexadecimal object" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = 234.25 - hex1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 0.0
      result.to_s.must_equal "0"
    end

    it "substracts two floats (check minus works)" do
      result = 234.25 - 234.25

      result.must_equal 0.0
    end

    it "substracts one hexadecimal object with an integer" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 - 234

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 0.25
      result.to_s.must_equal "0.4"
    end

    it "substracts one integer with an hexadecimal object" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = 234 - hex1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal -0.25
      result.to_s.must_equal "-0.4"
    end

    it "substracts two integers (check minus works)" do
      result = 234 - 230

      result.must_equal 4
    end

    it "substracts one positive hexadecimal object and one negative hexadecimal object" do
      hex1 = Hexadecimal.from_string "EA.4"
      hex2 = Hexadecimal.from_string "-EA.4"

      result = hex1 - hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 468.5
      result.to_s.must_equal "1D4.8"
    end
  end

  describe "multiply" do
    it "multiply two positive hexadecimals objects" do
      hex1 = Hexadecimal.from_string "EA.4"
      hex2 = Hexadecimal.from_string "EA.4"

      result = hex1 * hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 54873.0625
      result.to_s.must_equal "D659.1"
    end

    it "multiply one hexadecimal object with a float" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 * 234.25

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 54873.0625
      result.to_s.must_equal "D659.1"
    end

    it "multiply one float with an hexadecimal object" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = 234.25 * hex1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 54873.0625
      result.to_s.must_equal "D659.1"
    end

    it "multiply two floats (check multiply is not broken)" do
      result = 234.25 * 234.25

      result.must_equal 54873.0625
    end

    it "multiply one hexadecimal object with an integer" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 * 1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 234.25
      result.to_s.must_equal "EA.4"
    end

    it "multiply one hexadecimal object with a negative integer" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 * -1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal -234.25
      result.to_s.must_equal "-EA.4"

    end

    it "multiply one integer with an hexadecimal object" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = -1 * hex1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal -234.25
      result.to_s.must_equal "-EA.4"
    end

    it "multiply two integers (check multiply is not broken)" do
      result = 2 * 2

      result.must_equal 4
    end

    it "multiply one positive hexadecimal object and one negative hexadecimal object" do
      hex1 = Hexadecimal.from_string "EA.4"
      hex2 = Hexadecimal.from_string "-EA.4"

      result = hex1 * hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal -54873.0625
      result.to_s.must_equal "-D659.1"
    end
  end

  describe "divide" do
    it "divides two positive hexadecimals objects" do
      hex1 = Hexadecimal.from_string("EA.4")
      hex2 = Hexadecimal.from_string("EA.4")

      result = hex1 / hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 1
      result.to_s.must_equal "1"
    end

    it "divides one hexadecimal object with a float" do
      hex1 = Hexadecimal.from_string("EA.4")

      result = hex1 / 234.25

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 1
      result.to_s.must_equal "1"
    end

    it "divides one float with an hexadecimal object" do
      hex1 = Hexadecimal.from_string("EA.4")

      result = 234.25 / hex1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 1
      result.to_s.must_equal "1"
    end

    it "divides two floats (check divide is not broken)" do
      result = 234.25 / 234.25

      result.must_equal 1
    end

    it "divides one hexadecimal object with an integer" do
      hex1 = Hexadecimal.from_string("EA.4")

      result = hex1 / 1

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 234.25
      result.to_s.must_equal "EA.4"
    end

    it "divides one integer with an hexadecimal object" do
      hex1 = Hexadecimal.from_string("EA.4")

      result = 1 / hex1

      result.must_be_instance_of Hexadecimal
      result.to_s.must_equal "0.0117C4FC72BFCB"
      result.to_float.must_equal 0.004268943436499467
    end

    it "divides two integerse (check divide is not broken)" do
      result = 1 / 2

      result.must_equal 0
    end

    it "divides one positive hexadecimal object and one negative hexadecimal object" do
      hex1 = Hexadecimal.from_string("EA.4")
      hex2 = Hexadecimal.from_string("-EA.4")

      result = hex1 / hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal -1
      result.to_s.must_equal "-1"
    end

    it "divide by zero return Infinity" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 / 0

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal Float::INFINITY
      result.to_s.must_equal "Infinity"
    end
  end

  describe "pow" do
    it "pows two positive hexadecimals objects" do
      hex1 = Hexadecimal.from_string "EA.4"
      hex2 = 2.34.to_hex

      result = hex1 ** hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 350792.4704875763
      result.to_s.must_equal "55A48.7871DFB161FF7C"
    end

    it "pows two big positive hexadecimals object (should return Infinite)" do
      hex1 = Hexadecimal.from_string "EA.4"
      hex2 = Hexadecimal.from_string "EA.4"

      result = hex1 ** hex2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal Float::INFINITY
      result.to_s.must_equal "Infinity"
    end

    it "pows one hexadecimal object with a float" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 ** 2.34

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 350792.4704875763
      result.to_s.must_equal "55A48.7871DFB161FF7C"
    end

    it "pows one float with an hexadecimal object" do
      hex1 = Hexadecimal.from_string "A"

      result = 2.34 ** hex1

      result.must_be_instance_of Float
      result.must_equal 4922.19227058666
    end

    it "pows two float (check pow is not broken)" do
      result = 2.34 ** 10.0

      result.must_equal 4922.19227058666
    end

    it "pows one hexadecimal object with an integer" do
      hex1 = Hexadecimal.from_string "EA.4"

      result = hex1 ** 2

      result.must_be_instance_of Hexadecimal
      result.to_float.must_equal 54873.0625
      result.to_s.must_equal "D659.1"
    end

    it "pows one integer with an hexadecimal object" do
      hex1 = Hexadecimal.from_string "A"

      result = 2 ** hex1

      result.must_be_instance_of Fixnum
      result = 1024
    end

    it "pows one integer with an hexadecimal (with comma) object" do
      hex1 = Hexadecimal.from_string "A.1"

      result = 2 ** hex1

      result.must_be_instance_of Float
      result.must_equal 1069.3363532056717
    end

    it "pows two integer (check pot is not broken)" do
      result = 2 ** 3

      result.must_equal 8
    end

    it "pows one positive hexadecimal object and one negative hexadecimal object" do
      hex1 = Hexadecimal.from_string "A.1"
      hex2 = Hexadecimal.from_string "-A.2"

      result = hex1 ** hex2

      result.must_be_instance_of Hexadecimal
      result.to_s.must_equal "7.67161712141568"
      result.to_float.must_equal 7.040489085609713e-11
    end
  end
end
