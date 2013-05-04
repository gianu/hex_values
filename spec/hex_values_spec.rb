require 'spec_helper'

describe 'HexValues' do
  describe "float to hex" do
    it "converts 234.25 to EA.4" do
      234.25.to_hex.must_equal "EA.4"
    end

    it "converts 1875.37 to 753.5EB851EB85" do
      1875.37.to_hex.must_equal "753.5EB851EB851EB8"
    end

    it "converts 5476.28 to 1564.47AE147AE1" do
      5476.28.to_hex.must_equal "1564.47AE147AE147AE"
    end

    it "converts 7763783.89 to 767747.E3D70A3C" do
      7763783.89.to_hex.must_equal "767747.E3D70A3D70A3D7"
    end

    it "converts 1 to 1" do
      1.to_hex.must_equal "1"
    end

    it "converts 10 to A" do
      10.to_hex.must_equal "A"
    end

    it "converts 0.25 to 0.4" do
      0.25.to_hex.must_equal "0.4"
    end

    it "converts 0.21 to 0.35C28F5C28F5C2" do
      0.21.to_hex.must_equal "0.35C28F5C28F5C2"
    end

    it "converts 0 to 0" do
      0.to_hex.must_equal "0"
    end
  end

  describe "hex to float" do
    it "converts EA.4 to 234.25" do
      "EA.4".to_float.must_equal 234.25
    end

    it "converts 753.5EB851EB85 to 1875.37" do
      "753.5EB851EB85".to_float.must_equal 1875.37
    end

    it "converts 1564.47AE147AE1 to 5476.28" do
      "1564.47AE147AE1".to_float.must_equal 5476.28
    end

    it "converts 767747.E3D70A3C to 7763783.89" do
      "767747.E3D70A3C".to_float.must_equal 7763783.89
    end

    it "converts 1 to 1" do
      "1".to_float.must_equal 1.0
    end

    it "converts A to 10" do
      "A".to_float.must_equal 10.0
    end

    it "converts 0.4 to 0.25" do
      "0.4".to_float.must_equal 0.25
    end

    it "converts 0.35C28F5C28F5C2 to 0.21" do
      "0.35C28F5C28F5C2".to_float.must_equal 0.21
    end

    it "converts an empty string to 0" do
      "".to_float.must_equal 0
    end
  end
end
