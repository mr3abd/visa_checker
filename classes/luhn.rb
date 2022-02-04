class Luhn
  class << self
    # Write a function that takes one parameter, the credit card number, and returns true or false depending on
    # whether the number is a valid number.
    def is_luhn_valid?(card_number)
      luhn_checksum(card_number).zero? ? "Valid" : "Invalid"
    end

    # write a second function that takes a
    # number of any length and calculates the Luhn check digit and returns the original
    # number with the check digit appended on the end.
    def calculate_luhn(partial_card_number)
      card_number = partial_card_number.to_i * 10
      check_digit = luhn_checksum(card_number)
      appended_number = check_digit.zero? ? check_digit : (10 - check_digit)
      card_number + appended_number
    end

    private
    def digits_of(n)
      n.to_s.split(//).map(&:to_i)
    end

    # get digits by following rule
    # double the value of every second digit
    # if the product of this doubling operation is greater than 9 (e.g., 8 × 2 = 16),
    # then sum the digits of the products (e.g., 16: 1 + 6 = 7, 18: 1 + 8 = 9).
    def get_digits(card_number)
      numbers = digits_of(card_number)
      numbers.reverse.map.with_index do |n, i|
        if i.odd?
          t = n*2 # double second digits
          t > 9 ? digits_of(t).inject(:+) : t
        else
          n
        end
      end
    end

    def sum_of_digits(card_number)
      get_digits(card_number).inject(:+)
    end

    def luhn_checksum(card_number)
      # computing the sum of digits then computing 9 times that value modulo 10 (in equation form, (67 × 9 mod 10))
      sum_of_digits(card_number) % 10
    end
  end
end
