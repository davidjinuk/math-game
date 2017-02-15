class Question
  attr_reader :answer

  def initialize
    @number_1 = rand(1..20)
    @number_2 = rand(1..20)
    @answer = @number_1 + @number_2
  end

  def random_question
    "What does #{@number_1} plus #{@number_2} equal?"
  end

  def correct?(player_input)
    if player_input === @answer
      true
    else
      false
    end
  end
end