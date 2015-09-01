require 'pry'

class Airplane
  attr_reader :type, :wing_loading, :horsepower
  attr_accessor :engine, :flight, :fuel
  def initialize(type, wing_loading, horsepower, fuel)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engine = "off"
    @flight = "grounded"
    @fuel = fuel
  end

  def start(engine)
   if @fuel >= 3 && engine == "off"
     engine = "on"
     @fuel -= 1
     return "engine started"
   elsif @fuel >= 3 && engine == "on"
     return "engine already started"
   else
     return "not enough fuel"
   end
  end

  def takeoff(engine)
    if engine != "off"
      @flight = "flying"
      @fuel -= 1
      return "flying"
    else
      return "Please turn on your engine"
    end
  end

  def land(flight)
    if flight != "grounded"
      flight = "grounded"
      @fuel -= 1
      return "Landing now!"
    else
      return "You're not even flying, dude."
    end
  end

end
