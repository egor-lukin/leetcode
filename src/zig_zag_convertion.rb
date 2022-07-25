require 'byebug'

class ZigZagConvertion

  # @param {String} s
  # @param {Integer} num_rows
  # @return {String}
  def convert(str, num_rows)
    return str if num_rows == 1

    rev_str = ""
    rows = num_rows * 2 - 2

    (0..(num_rows - 1)).each do |i|
      (0..(str.size / rows)).each do |j|
        index = j * rows + i
        break if index > str.size - 1

        rev_str += str[index]
        index_between_rows = index + (2 * ((num_rows - 1) - i))
        if i != 0 && i != (num_rows - 1) && index_between_rows <= str.size - 1
          rev_str += str[index_between_rows]
        end
      end
    end

    rev_str
  end
end
