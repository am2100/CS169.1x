class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    game = "#{player1[1] + player2[1]}"
    raise NoSuchStrategyError.new('Strategy must be one of R,P,S') unless game =~/\A[RPS]{2}\z/
    game =~ /(SR|PS|RP)/ ? player2 : player1
  end

  def self.tournament_winner(tournament)
    t = tournament.flatten.each_slice(2).to_a
    p1, p2 = t.shift, t.shift
    t.push(self.winner(p1, p2))
    t.length > 1 ? self.tournament_winner(t) : t[0]
  end
end

