class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games

  after_create :generate_first_game

  def generate_first_game
    game = games.create(status: "in progress", word: generate_word)
    # build 6 rows
  end

  def generate_word
    url = "https://www.thefreedictionary.com/dictionary.htm"
    while true
      html_file = URI.open(url).read
      html_doc = Nokogiri::HTML(html_file)
      words = html_doc.search(".lst").children.map(&:text).select { |word| word.size == 5 }
      return words.sample if words.any?
    end
  end
end
