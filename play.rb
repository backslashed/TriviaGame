#!/usr/bin/env ruby -w

require "./TriviaGame"

game = TriviaGame.new( "TriviaGame.csv" )
game.play(3)