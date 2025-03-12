require "sinatra"
require "sinatra/reloader"

def roll_dice(num_dice, num_sides)
  Array.new(num_dice) { rand(1..num_sides) }
end

get '/' do
  erb (:index)
end

get '/process_roll' do
  @num_dice = params[:dice].to_i
  @num_sides = params[:sides].to_i
  @rolls = roll_dice(@num_dice, @num_sides)
  erb (:result)
end
