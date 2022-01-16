module ApplicationHelper
  def letter_background(letter, index, word)
    return 'background-color: #6aaa64' if word[index] == letter

    return 'background-color: #ffe156' if word.include?(letter) && letter != ''

    return 'background-color: #3a3a3c' if letter != ''

    'background-color: grey'
  end

  def active_word(attempt, index)
    index == attempt.words.count && !attempt.finished
  end

  def keyboard_letter_background(letter, attempted_words, solution_word)
    color = '#d3d6da'

    color = 'grey' if attempted_words.join.include?(letter)

    # if attempted_words.join.include?(letter)
    #   attempted_words.each do |word|
    #     word.chars.each do |char|
    #       color = solution_word.include?(char) ? '#ffe156' : color
    #     end
    #   end
    # end

    return "background-color: #{color}; #{'color: white;' if color == 'grey'}"
  end
end
