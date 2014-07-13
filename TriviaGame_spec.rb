require "spec_helper"
require "./TriviaGame"

describe TriviaGame do
  it "should shuffle tests for new games" do  
    allow(STDIN).to receive(:gets).and_return("AA")
    expect_any_instance_of(Array).to receive(:shuffle!).once

    @game = TriviaGame.new( "TriviaGame.csv" )
    @game.play(3)
  end
  
  it "should get score for number of questions requested" do
    allow(STDIN).to receive(:gets).and_return("AA")
    expect(@game).to receive(:get_score_for).exactly(5).times.and_return(0)
    
    @game = TriviaGame.new( "TriviaGame.csv" )
    @game.play(5)
  end
  
  it "should increase score when answer is incorrect" do
    allow(CSV).to receive(:foreach).and_yield(["Q", "A"])
    allow_any_instance_of(Array).to receive(:shuffle!).and_return(nil)

    expect(STDIN).to receive(:gets).and_return("a")
    expect(STDOUT).to receive(:puts).with("You scored 10/10")

    @game = TriviaGame.new(nil)
    @game.play(1)
  end

  it "should decrease score when answer is incorrect" do
    allow(CSV).to receive(:foreach).and_yield(["Q", "A"])
    allow_any_instance_of(Array).to receive(:shuffle!).and_return(nil)

    expect(STDIN).to receive(:gets).and_return("B")
    expect(STDOUT).to receive(:puts).with("You scored -5/10")

    @game = TriviaGame.new(nil)
    @game.play(1)
  end
end