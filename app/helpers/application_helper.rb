module ApplicationHelper
  def letter_background(letter, index, word)
    return 'background-color: #6aaa64' if word[index] == letter

    return 'background-color: #ffe156' if word.include?(letter) && letter != ''

    return 'background-color: #3a3a3c' if letter != ''

    'background-color: grey'
  end

  def acitve_word(attempts, index)
    index == attempts.count
  end
end
