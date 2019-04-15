require_relative '../french_ssn'

describe "#french_ssn" do
  describe "when passed an empty string" do
    it "returns 'The number is invalid" do
      actual = french_ssn("")
      expected = "The number is invalid"

      expect(actual).to eq(expected)
    end
  end

  describe "when passed '1 84 12 76 451 089 46'" do
    it "returns 'a man, born in December, 1984 in Seine-Maritime." do
      actual = french_ssn('1 84 12 76 451 089 46')
      expected = "a man, born in December, 1984 in Seine-Maritime."

      expect(actual).to eq(expected)
    end
  end
end

describe "#valid_key?" do
  describe "when passed '1 84 12 76 451 089 46' and '46'" do
    it "returns true" do
      actual = valid_key?('1 84 12 76 451 089 46', '46')
      expect(actual).to be true
    end
  end

  describe "when passed '1 84 12 76 451 089 46' and '76'" do
    it "returns false" do
      actual = valid_key?('1 84 12 76 451 089 46', '76')
      expect(actual).not_to be true
    end
  end
end
