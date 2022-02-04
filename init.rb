require_relative 'classes/luhn'
def start_app
  # Wellcome in Visa Checker App
  p "#" * 10
  p "Wellcome in Visa Checker App"
  p "Please Add your visa to now is valid or now or is Visa/MasterCard "
  print "->"

  payment_number = gets.chomp
  p payment_number
  payment_checker(payment_number)
end
def payment_checker(payment_number)
  # validate_payment
  # Should be all numbers as validate process
  # {:master=>[51, 51], :visa=>[4]}
  print "INVALID_NUMBERS" unless payment_number.to_i.to_s.eql? payment_number
  puts Luhn.is_luhn_valid?(payment_number)
end

def visa?(payment_number)
#  Visa uses 13- and 16-digit numbers.
# all Visa numbers start with 4
end

def master_card?(payment_number)
# MasterCard uses 16-digit numbers
# MasterCard numbers start with 51, 52, 53, 54, or 55
end

def validate_payment
#   3 process to check valid or not valid
# luhn
# For the sake of discussion, let’s first underline every other digit, starting with the number’s second-to-last digit:
#
# (4)0(0)3(6)0(0)0(0)0(0)0(0)0(1)4
end
start_app
