require 'pry'

def contains_repeated_substrings?(input)
  a = input.match(/(.+)\1+/)
  a != nil && a[0] != nil
end

def wordpattern(pattern, input)
  pattern_parts = pattern.split('')
  pattern_count = pattern_parts.count


  input_parts = input.split('')
  input_count = input_parts.count
  if (contains_repeated_substrings?(input)) == 0

    pattern_parts.each_with_index {|i, index_i|
      pattern_parts.each_with_index {|j, index_j|

        if pattern_parts[index_i] == pattern_parts[index_j]
          if input_chunks[index_i] == input_chunks[index_j]
            # p "YES; keep going"
          else
            # p "NOOOO"
            return 0
          end
        else
          if input_chunks[index_i] == input_chunks[index_j]
            # p "NOOOO, should not match"
            return 0
          else
            # p "inequality sounds good, keep going"
          end
        end
      }
    }
    1
  else
    0
  end
end

def all_possible_next_chunks(remaining_length, remaining_chars, possible_chunks=[])
  # possible_chunks = [[aa, bb], [a, abb], [a, ab, b]]
  if remaining_length == 0
    return possible_chunks
  else
    1.upto(remaining_length).each { |length|
      possible_chunks.each { |pc|
        pc
      }
      remaining_length = input_count - length

    }
  end
end

files = Dir.glob("test_cases_omjs2ksa/input*")
files.each do |f|
  fp = File.open(f, 'r')
  lines = fp.readlines
  _pattern = lines[0].strip
  _input = lines[1]

  res = wordpattern(_pattern, _input);

  output_file = f.gsub('input', 'output')
  ofp = File.open(output_file, 'w')
  ofp.write res
  fp.close()
end

a = wordpattern("abba", "redbluebluered")
p a == 1
p a

b = wordpattern("abcdab", "tobeornottobe")
p b == 1
p b

c = wordpattern("abcdb", "tobeornottobe")
p c == 0
p c
