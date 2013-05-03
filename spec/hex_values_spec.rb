require 'spec_helper'

describe 'HexValues' do
  describe "float to hex" do
    it "converts 234.25 to EA.4" do
      234.25.to_hex.must_equal "EA.4"
    end
  end

  describe "hex to float" do
    it "converts EA.4 to 234.25" do
      "EA.4".to_float.must_equal 234.25
    end
  end
end
