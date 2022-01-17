class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  def current_user
    super || guest_user
  end

  def user_signed_in?
    !current_user.guest
  end

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
        k: 'k',
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

  private

  def transfer_guest_to_user
    if current_user.attempts
      guest_user.attempts.update_all(user_id: current_user.id)
    end
  end
end
