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

    pattern_parts.each_with_index do |i, index_i|
      pattern_parts.each_with_index do |j, index_j|
        all_possible_next_chunks(input_parts).each do |arr|
          all_matches = arr.each_with_index.map do |arr_element, arr_index|
            if pattern_parts[index_i] == pattern_parts[index_j]
              if arr[index_j] == arr[index_j]
                true
              else
                false
              end
            else
              if arr[index_j] == arr[index_j]
                false
              else
                true
              end
            end
          end

          if all_matches.all?
            return 1
          end
        end
      end
    end
    0
  else
    0
  end
end

def all_possible_next_chunks(remaining_length, remaining_chars=remaining_length, possible_chunks=[])
  # possible_chunks = [[aa, bb], [a, abb], [a, ab, b]]
  if remaining_length == 0
    return possible_chunks
  else
    1.upto(remaining_length).each { |length|

    }
  end
end

def split_word s
  (0..s.length).inject([]){|ai,i|
    (1..s.length - i).inject(ai){|aj,j|
      aj << s[i,j]
    }
  }.uniq
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
