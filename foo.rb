require 'pry'
def wordpattern(pattern, input)
  pattern_parts = pattern.split('')
  pattern_count = pattern_parts.count


  input_parts = input.split('')
  input_count = input_parts.count
  if (input_count % pattern_count) == 0
      pattern_map = {}
    pattern_parts.each {|i|
      pattern_map[i] ||= 0
      pattern_map[i] += 1
    }

    input_map = {}
    input_equivalent_length = input_count / pattern_count

    clone_input = input_parts.clone

    input_sized_chunks = []

    upto = 0
    input_chunks = 0.upto(input_count / pattern_count).map {|i|
      # puts "upto: #{upto}, #{upto + input_equivalent_length}"
      # ruby substring is start and length, not start and end
      a = clone_input[upto, input_equivalent_length].join('')
      # p a
      upto += input_equivalent_length
      a
    }

    #  a b b a
    # foo bar bar foo

    pattern_parts.each_with_index {|i, index_i|
      pattern_parts.each_with_index {|j, index_j|
        # binding.pry
        # p pattern_parts
        # p input_chunks
        # binding.pry
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

a = wordpattern("abba", "foobarbarfoo")
p a == 1
p a

b = wordpattern("abba", "foobarbarfoobaz")
p b == 0
p b

c = wordpattern("abba", "aaaabbbb")
p c == 0
p c
