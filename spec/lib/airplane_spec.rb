require 'pry'
require_relative "../../lib/airplane"

describe Airplane do
  let(:airplane) { Airplane.new("cesna", 10, 150, 5) }
  #let(:airplane_2) { Airplane.new("cesna", 10, 150, 2) }

  describe "#initialization" do
    it "builds a plane " do
      expect(airplane.type).to eq("cesna")
      expect(airplane.wing_loading).to eq(10)
      expect(airplane.horsepower).to eq(150)
    end
  end

  describe "#start" do
    it "turns on engine if not already running" do
      expect(airplane.start("off")).to eq("engine started")
    end
    it "engine was already running, give us status" do
      expect(airplane.start("on")).to eq("engine already started")
    end
    it "will not start without enough fuel" do
      plane = Airplane.new("cesna", 10, 150, 2)
      expect(plane.start("off")).to eq("not enough fuel")

    end
  end

  describe "#takeoff" do
    it "changes the state of the plane to flying" do
      expect(airplane.takeoff("on")).to eq("flying")
    end
    it "reports if engines are off" do
      expect(airplane.takeoff("off")).to eq("Please turn on your engine")
    end
  end

  describe "#land" do
    it "lands a flying plane" do
      expect(airplane.land("flying")).to eq("Landing now!")
    end
    it "doesn't land a grounded plane" do
      expect(airplane.land("grounded")).to eq("You're not even flying, dude.")
    end
  end

end
