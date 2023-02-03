# frozen_string_literal: true

# Diamond
class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a

    build(letters)
  end

  def self.build(letters)
    space = letters.length
    top = letters
          .map.with_index do |letter, i|
      "#{format_str(letter, space, i)}"\
      "#{format_str(letter, space, i).reverse[1..]}"\
    end
    bottom = top.reverse[1..]

    top.concat(bottom).join("\n").concat("\n")
  end

  def self.format_str(str, space, idx)
    str.rjust(space - idx, ' ').ljust(space, ' ')
  end
end
