class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
=begin
In a game of rock-paper-scissors, each player chooses to play Rock (R), Paper (P), or Scissors (S). The rules are: Rock beats Scissors, Scissors beats Paper, but Paper beats Rock.
A rock-paper-scissors game is encoded as a list, where the elements are 2-element lists that encode a player’s name and a player’s strategy.
 [ [ "Armando", "P" ], [ "Dave", "S" ] ]
 # => returns the list ["Dave", "S"] wins since S>P
(a) Write a method rps_game_winner that takes a two-element list and behaves as follows: - If the number of players is not equal to 2, raise WrongNumberOfPlayersError
- If either player's strategy is something other than "R", "P" or "S" (case-insensitive), raise NoSuchStrategyError
- Otherwise, return the name and strategy of the winning player. If both players use the same strategy, the first player is the winner.
We'll get you started:

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  # your code here
end
(b) A rock, paper, scissors tournament is encoded as a bracketed array of games - that is, each element can be considered its own tournament.
[ [
   [ ["Richard", "R"],  ["Michael", "S"] ],
 ],
 [
   [ ["Allen", "S"], ["Omer", "P"] ],
   [ ["David E.", "R"], ["Richard X.", "P"] ]
] ]
Under this scenario, Dave would beat Armando (S>P), Richard would beat Michael (R>S), and then Dave and Richard would play (Richard wins since R>S); similarly, Allen would beat Omer, Richard X would beat David E., and Allen and Richard X. would play (Allen wins since S>P);
[ ["Armando", "P"], ["Dave", "S"] ],
and finally Richard would beat Allen since R>S, that is, continue until there is only a single winner.
● Write a method rps_tournament_winner that takes a tournament encoded as a bracketed array and returns the winner (for the above example, it should return [“Richard”, “R”]).
● Tournaments can be nested arbitrarily deep, i.e., it may require multiple rounds to get to a single winner. You can assume that the initial array is well formed (that is, there are 2^n players, and each one participates in exactly one match per round).
=end

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
    puts "looking at game: #{game}\n"
    raise WrongNumberOfPlayersError unless game.length == 2
    raise NoSuchStrategyError unless game.all? {|x| [:s,:p,:r].member? x[1].downcase.to_sym}

    first = game[0]
    first_move = game[0][1].downcase.to_sym
    second = game[1]
    second_move = game[1][1].downcase.to_sym

    case

    when first_move == second_move
        first #first wins by default
    when first_move == :s && second_move == :p
        first
    when first_move == :s && second_move == :r
        second
    when first_move == :r && second_move == :s
        first
    when first_move == :r && second_move == :p
        second
    when first_move == :p && second_move == :r
        first
    when first_move == :p && second_move == :s
        second
    else
        raise "unknown move. first #{first_move} second #{second_move}"
    end
end

#game:  [ [ "Armando", "P" ], [ "Dave", "S" ] ]

#bracket: [ [
#            [ ["Armando", "P"], ["Dave", "S"] ],
#            [ ["Richard", "R"],  ["Michael", "S"] ],
#       ],
#
# [
#   [ ["Allen", "S"], ["Omer", "P"] ],
#   [ ["David E.", "R"], ["Richard X.", "P"] ]
#] ]
#

[ [ [ ["Armando", "P"], ["Dave", "S"] ], [ ["Richard", "R"],  ["Michael", "S"] ], ], [ [ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ] ] ]



def rps_tournament_winner(bracket)
    while bracket.length > 1
        bracket.reduce([]) do |result, value|
            result << rps_tournament_winner(value)
            result
        end
    end
    puts "bracket length is one"
    return rps_game_winner bracket[0]
end
