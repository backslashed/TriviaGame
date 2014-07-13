require "spec_helper"
require "./TriviaGame"

describe TriviaGame do
  before :each do
    @game = TriviaGame.new( "TriviaGame.csv" )
  end

  it "should shuffle tests for new games" do
    expect_any_instance_of(Array).to receive(:shuffle!).once
    @game.play(3)
  end
  
  it "should get score for number of questions requested" do
    expect(@game).to receive(:get_score_for).exactly(5).times.and_return(0)
    @game.play(5)
  end
  
  it "should decrease score when answer is incorrect" do

  end
end