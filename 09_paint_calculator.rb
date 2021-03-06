# Calculate gallons of paint needed to paint the ceiling of a room.
# Prompt for the length and width, and assume one gallon covers 350 square feet.
# Display the number of gallons needed to paint the ceiling as a whole number.
#
# Example Output
#        You will need to purchase 2 gallons of
#        paint to cover 360 square feet.
# Remember, you can’t buy a partial gallon of paint. You must round up to the next whole gallon.
# Constraints
# • Use a constant to hold the conversion rate.
# • Ensure that you round up to the next whole number.

#pseudocode
#prompt for the length
#store the length

#prompt for the width
#store the width

#check is a number not: a string of characters/letters, a 0 in a string
#boolean

#calculate area of ceiling
#length * width

#calculate area in feet

#calculate gallons needed
#area in feet / 360
#result * 2

#displays gallons of paint needed(number_of_gallons, area_square_feet)
#puts "You will need to purchase #{number_of_gallons} gallons of paint to cover #{area_square_feet)} square feet."

class DisplaysGallons
  def initialize(gallons, area)
    @gallons = gallons
    @area = area
  end

  def displays_gallons
    if @gallons == 1
      puts "You will need to purchase #{@gallons} gallon of paint to cover #{@area} square feet."
    else
      puts "You will need to purchase #{@gallons} gallons of paint to cover #{@area} square feet."
    end
  end
end

def main_programme
  keyboard = Keyboard.new
  length = keyboard.gets_length
  width = keyboard.gets_width

  calculator = Calculator.new(length, width)
  gallons = calculator.calculate_gallons
  area = calculator.area

  DisplaysGallons.new(gallons, area).displays_gallons
end

class Keyboard
#This method does two things it both displays a message to a user & takes its input- so should these therefore be separated into 2 classes & by proxy into 2 methods? That said the one needs the other.
  def gets_length
    puts "Please input the length in feet"
    length = gets.chomp
    checker = ChecksValidity.new(length)
    if checker.is_valid?
      length.to_f
    else
      gets_length() #no error message given
    end
  end

  def gets_width
    puts "Please input the width in feet"
    width = gets.chomp
    checker = ChecksValidity.new(width)
    if checker.is_valid?
      width.to_f
    else
      gets_width() #no error message given
    end
  end
end


class Calculator
  attr_reader :length, :width
  def initialize(length, width)
    @length = length
    @width = width
  end

  def area
     @length * @width
  end

  Gallons = 350
  def calculate_gallons
    gallons, remainder = area().divmod(Gallons)
    if remainder > 0
      gallons + 1
    else
      gallons
    end
  end
end




class ChecksValidity
  attr_reader :length, :width

  def initialize(user_input)
    @user_input = user_input
  end

  def is_valid?
    if @user_input == "0"
      false
    elsif @user_input =~ /^\d+$/
      true
    else
      false
    end
  end

end


main_programme




# RSpec.describe "creates a paint calculator" do
#   it "runs the main programme" do
#     expect{ main_programme("5", "20") }.to output(/purchase 1 gallon of paint to cover 100 /).to_stdout
#   end
#   it "returns true if the string contains a digit" do
#     expect(contains_digits?("123")).to eq true
#   end
#   it "returns false if the string contains letters" do
#     expect(contains_digits?("wdcsf56")).to eq false
#   end
#   it "returns false if the string contains other characters" do
#     expect(contains_digits?("*&1")).to eq false
#   end
#   it "converts a string to a number" do
#     expect(convert_to_number("12")).to eq (12)
#   end
#   it "returns true if the input is valid" do
#     expect(are_valid?("5","3")).to eq (true)
#   end
#   it "returns false if the input is invalid" do
#     expect(are_valid?("t@£","68d")).to eq (false)
#   end
#   it "calculates the area of the ceiling" do
#     expect(calculate_area_of_ceiling(5,5)).to eq (25)
#   end
#   it "returns 1 if the area is less than or equal to 350" do
#     expect(calculate_gallons(280)).to eq (1)
#     expect(calculate_gallons(350)).to eq (1)
#   end
#   it "returns 2 if the area is less than or equal to 700" do
#     expect(calculate_gallons(600)).to eq (2)
#     expect(calculate_gallons(360)).to eq (2)
#   end
#   it "returns 3 if the area is less than or equal to 1050" do
#     expect(calculate_gallons(900)).to eq (3)
#   end
#   it "returns 2 if the area if more than 350 and less than 700" do
#     expect(calculate_gallons(400)).to eq (2)
#   end
#   it "gives the number of gallons of paint needed according to the area" do
#     expect(calculate_gallons(400)).to eq (2)
#   end
#   it "displays the number of gallons needed for an area" do
#     expect{ displays_gallons(2, 750) }.to output(/purchase 2 gallons of paint to cover 750 /).to_stdout
#     expect{ displays_gallons(1, 280) }.to output(/purchase 1 gallon of paint to cover 280 /).to_stdout
#   end
# end
