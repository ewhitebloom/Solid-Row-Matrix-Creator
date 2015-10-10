def matrix_creator(string)
  i = 2
  potentials = []
  while i < string.length
    if (string.length % i == 0)
      potentials << string.scan(/.{#{i}}/)
    end
    i += 1
  end
  potentials
end

def max_rows(string)
  potentials = matrix_creator(string)
  num_of_rows = potentials.map{ |matrix|
    count = 0
    matrix.each{ |row|
      count += 1 if !!(row =~ /^1+$/)
    }
    count
  }
  potentials[num_of_rows.find_index(num_of_rows.max)]
end

def max_cols(string)
  potentials = matrix_creator(string)
  num_of_cols = potentials.map{ |matrix|
    count = 0
    for n in 0..(matrix.first.length - 1)
      solid_col = true
      for i in 0..(matrix.length - 1)
        solid_col = false if matrix[i].split("")[n].to_i != 1
      end
      count += 1 if solid_col
    end
    count
  }
  potentials[num_of_cols.find_index(num_of_cols.max)]
end

def display_size_of_board(matrix)
  "#{matrix.size}x#{matrix.first.length}"
end

def run_and_display(string)
  if max_rows(string) == max_cols(string)
    puts "Size: " + display_size_of_board(max_rows(string))
    puts max_rows(string)
  else
    puts 'Max Rows:'
    puts "Size: " + display_size_of_board(max_rows(string))
    puts max_rows(string)
    puts
    puts 'Max Cols:'
    puts "Size: " + display_size_of_board(max_cols(string))
    puts max_cols(string)
  end
end

run_and_display("010110010101111111")
