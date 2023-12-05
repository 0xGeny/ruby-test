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
  
  # Example ISBN
  isbn_without_check_digit = gets.chomp
  check_digit = calculate_isbn_check_digit(isbn_without_check_digit)
  
  complete_isbn = "#{isbn_without_check_digit}#{check_digit}"
  puts "Complete ISBN: #{complete_isbn}"