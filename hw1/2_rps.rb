class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
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

def rps_tournament_winner(bracket)
    while bracket.flatten.length > 2
        bracket = rps_tournament_winner_helper bracket
    end
    return bracket
end

def rps_tournament_winner_helper(bracket)
    if bracket.flatten.length == 4
        return rps_game_winner bracket
    end

    bracket.map{|x| rps_tournament_winner x}
end
