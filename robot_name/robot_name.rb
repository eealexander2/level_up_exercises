class NameCollisionError < RuntimeError; end
class NameDuplicationError < RuntimeError; end

class Robot
  attr_accessor :name

  def initialize(args = {})
    @registry ||= []
    @name = args[:name_generator] || name_generator
    raise NameCollisionError, 'There was a problem generating the robot name!' unless @name =~ /[[:alpha:]]{2}[[:digit:]]{3}/
    raise NameDuplicationError, 'This name already exists!' if @registry.include?(@name)
    @registry << @name
  end

  def name_generator
    char = Array.new(2) { ("A".."Z").to_a.sample }.join
    num =  Array.new(3) { rand(10) }.join
    @name = "#{char}#{num}"
  end
end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."
# Errors!
# generator = -> { 'AA111' }
# Robot.new(name_generator: generator)
# Robot.new(name_generator: generator)
