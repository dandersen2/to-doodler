

describe Task do
let(:orange) { Orange.new(5) }


describe CarLoader do
  describe "#get_cars_from_csv" do
    it "returns an array of Car objects" do
      expect CarLoader.get_cars_from_csv('inventory.csv').to include (5839,Honda,Accord,2001)
    end
  end
end