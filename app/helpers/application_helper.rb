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

    white_background_color = ['#6aaa64', 'grey']

    color = 'grey' if attempted_words.join.include?(letter)

    if letter.in? solution_word.chars
      correct_positions = solution_word.chars.each_index.select{|i| solution_word.chars[i] == letter}
      correct_positions.each do |correct_position|
        color = '#6aaa64' if attempted_words.select { |aw| aw[correct_position] == letter }.any?
      end
      if letter.in?(attempted_words.join) && color != '#6aaa64'
        color = '#ffe156'
      end
    end
    # if attempted_words.join.include?(letter)
    #   attempted_words.each do |word|
    #     word.chars.each do |char|
    #       color = solution_word.include?(char) ? '#ffe156' : color
    #     end
    #   end
    # end

    return "background-color: #{color}; #{'color: white;' if color.in? white_background_color }"
  end
end
