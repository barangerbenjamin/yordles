class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def populate_grid(attempt)
    empty = 6 - attempt.words.size
    grid = attempt.words.map(&:chars) + [["", "", "", "", ""]] * empty
    grid
  end

  def keyboard
    {
      row_one: {
        q: 'q',
        w: 'w',
        e: 'e',
        r: 'r',
        t: 't',
        y: 'y',
        u: 'u',
        i: 'i',
        o: 'o',
        p: 'p'
      },
      row_two: {
        a: 'a',
        s: 's',
        d: 'd',
        f: 'f',
        g: 'g',
        h: 'h',
        j: 'j',
        l: 'l'
      },
      row_three: {
        enter: '↵',
        z: 'z',
        x: 'x',
        c: 'c',
        v: 'v',
        b: 'b',
        n: 'n',
        m: 'm',
        backspace: '←'
      }
    }
  end
end
