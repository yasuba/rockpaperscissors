Feature: Playing
	In order to play Rock Paper Scissors
	As a player
	I need to get two players

Scenario: A player can register
	Given I am on the homepage
	When I click "Go!"
	And I enter my name
	When I press "Play!"
	Then I should be ready to play

Scenario: A player is playing
	Given I've registered to play
	When I choose Paper
	Then I should see "RESULTS"

Scenario: A player has finished playing
	Given I have finished the game
	When I click "Play again!"
	Then I should be ready to play

