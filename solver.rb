class Solver
  def factorial(num)
    if num >= 0
      return 1 if num.zero?

      answer = num
      until num == 1
        num -= 1
        answer *= num
      end
      return answer
    end
    'Not a valid number'
  end

  def reverse(word)
    word.reverse
  end

  def fizzbuzz(num)
    return 'fizzbuzz' if (num % 3).zero? && (num % 5).zero?
    return 'fizz' if (num % 3).zero?
    return 'buzz' if (num % 5).zero?

    num.to_s
  end
end
