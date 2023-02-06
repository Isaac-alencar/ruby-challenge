# frozen_string_literal: true

# Complement
class Complement
  RNA_COMPLEMENT = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(nucleotides)
    nucleotides.chars.map { |nucleotide| RNA_COMPLEMENT[nucleotide] }.join
  end
end
