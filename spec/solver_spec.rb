require_relative '../solver'

describe '#Factorial' do
  before(:all) do
    @value = Solver.new
  end

  context 'an argument and return factorial' do
    it 'factorial of 5 to be 120' do
      expect(@value.factorial(5)).to eq(120)
    end

    it 'factorial of 0 to be 1' do
      expect(@value.factorial(0)).to eq(1)
    end

    it 'factorial of negative number to be not valid' do
      expect(@value.factorial(-5)).to eq('Not a valid number')
    end
  end
end

describe '#Reverse' do
  before(:all) do
    @value = Solver.new
  end

  context 'an argument and return a string reverse' do
    it 'reverse of Hello to be "olleH"' do
      expect(@value.reverse('Hello')).to eq('olleH')
    end
  end
end

describe '#Fizzbuzz' do
  before(:all) do
    @value = Solver.new
  end

  context 'an argument and return a string' do
    it 'number divissible by 3 and return "fizz"' do
      expect(@value.fizzbuzz(3)).to eq('fizz')
    end

    it 'number divissible by 3 and return "buzz"' do
      expect(@value.fizzbuzz(5)).to eq('buzz')
    end

    it 'number divissible by 3 and 5 return "fizzbuzz"' do
      expect(@value.fizzbuzz(15)).to eq('fizzbuzz')
    end

    it 'expects 7 to not be divisible by 3 or 5 and return "7"' do
      expect(@value.fizzbuzz(7)).to eq('7')
    end
  end
end
