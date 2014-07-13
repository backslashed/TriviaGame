require "spec_helper"
require "./TriviaGame"

describe TriviaGame do
  it "should shuffle tests for new games" do  
    allow(STDIN).to receive(:gets).and_return("AA")
    @game = TriviaGame.new( "TriviaGame.csv" )
    expect_any_instance_of(Array).to receive(:shuffle!).once
    @game.play(3)
  end
  
  it "should get score for number of questions requested" do
    allow(STDIN).to receive(:gets).and_return("AA")
    @game = TriviaGame.new( "TriviaGame.csv" )
    expect(@game).to receive(:get_score_for).exactly(5).times.and_return(0)
    @game.play(5)
  end
  
  it "should decrease score when answer is incorrect" do
    expect(CSV).to receive(:foreach).and_yield(["Q", "A"]).and_yield(["QQ", "AA"])
    expect(STDIN).to receive(:gets).and_return("AA").twice
    allow_any_instance_of(Array).to receive(:shuffle!).and_return(nil)

    @game = TriviaGame.new(nil)
    @game.play(2)
  end
end