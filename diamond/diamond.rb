# frozen_string_literal: true

# Diamond
class Diamond
  @diamond = []
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a

    build(letters)
  end

  def self.build(letters)
    diamond = left_side(letters).zip(right_side(letters)).map(&:join).join("\n")
    @diamond = diamond.concat("\n")
  end

  def self.left_side(letters)
    space = letters.length

    top_left =
      letters.map.with_index do |letter, idx|
        letter
          .rjust(space - idx, ' ')
          .ljust(space, ' ')
      end

    _, *bottom_left = top_left.reverse

    top_left.concat(bottom_left)
  end

  def self.right_side(letters)
    space = letters.length

    top_right = letters
                .map.with_index do |letter, idx|
      letter
        .rjust(space - idx, ' ')
        .ljust(space, ' ')
        .reverse
    end

    _, *bottom_right = top_right.reverse

    top_right_side = top_right.map { |s| s[1..] }
    bottom_right_side = bottom_right.map { |s| s[1..] }

    top_right_side.concat(bottom_right_side)
  end
end
