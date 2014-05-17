class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    game = "#{player1[1] + player2[1]}"
    raise NoSuchStrategyError.new('Strategy must be one of R,P,S') unless game =~/\A[RPS]{2}\z/
    game =~ /(SR|PS|RP)/ ? player2 : player1
  end

  def self.tournament_winner(tournament)
    @@this_round = tournament.flatten.each_slice(2).to_a
    @@next_round = Array.new

    num_rounds = (Math.log(@@this_round.length/2)/Math.log(2)).to_i + 1
    num_rounds.times do |round|
      until @@this_round.empty?
        p1 = @@this_round.shift
        p2 = @@this_round.shift
        @@next_round << self.winner(p1, p2)
      end
      @@this_round = @@next_round
      @@next_round = [] unless @@next_round.length == 1
    end
     @@next_round[0]
  end
end

