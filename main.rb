def calculate_isbn_check_digit(isbn)
  digits = isbn.to_s.chars.map(&:to_i)
  
  sum = 0
  digits.each_with_index do |digit, index|
    multiplier = index.even? ? 1 : 3
    sum += digit * multiplier
  end
  
  check_digit = (10 - sum % 10) % 10
  check_digit
end

def valid_12_digit_number?(input)
  # Check if the input is a number
  return false unless input.match?(/^\d+$/)

  # Check if the number has exactly 12 digits
  input.to_s.length == 12
end
  
if __FILE__ == $0
  isbn_without_check_digit = gets.chomp

  if valid_12_digit_number?(isbn_without_check_digit)
    check_digit = calculate_isbn_check_digit(isbn_without_check_digit)
    
    complete_isbn = "#{isbn_without_check_digit}#{check_digit}"
    puts "Complete ISBN: #{complete_isbn}"
  else
    puts "#{isbn_without_check_digit} is not a valid 12-digit number."
  end
end