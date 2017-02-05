class Queens
  attr_reader :white, :black

  def initialize(opts)
    @white = Queen.new(opts[:white]) if opts[:white]
    @black = Queen.new(opts[:black]) if opts[:black]
  end

  def attack?
    on_same_rank? || on_same_file? || on_same_diagonal?
  end

  private

  def on_same_rank?
    white.rank == black.rank
  end

  def on_same_file?
    white.file == black.file
  end

  def on_same_diagonal?
    (white.rank - black.rank).abs == (white.file - black.file).abs
  end
end

class Queen
  attr_reader :rank, :file

  def initialize(position)
    raise ArgumentError if position.any? { |x| x < 0 || x > 7 }
    @rank = position[0]
    @file = position[1]
  end
end
