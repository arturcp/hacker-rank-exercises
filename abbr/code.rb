#!/bin/ruby
require 'byebug'
require 'colorize'

# https://www.hackerrank.com/challenges/abbr/problem
class Abbreviation
  def abbreviation(a, b)
    abbr?(a, b, 1) ? 'YES' : 'NO'
  end

  private

  def colorize(string, color)
    return string if ENV['DISABLE_COLORS']

    string.send(color)
  end

  def log(text)
    return unless ENV['DEBUG']

    puts text
  end

  def can_cut_remainder?(a, index_a)
    log "can_cut_remainder? index: #{index_a} a: #{a.inspect}"
    return true if index_a > a.length

    text = a.slice(index_a, a.length - index_a)
    log text
    text == text.downcase
  end

  def abbr?(a, b, id)
    # return false unless (a.chars.reject(&:is_lower?) - b.chars).empty?
    # return false if a.chars.reject(&:is_lower?).count > b.chars.count

    log ''
    log "#{colorize('abbr?', 'green')}('#{colorize(a, 'yellow')}', '#{colorize(b, 'light_blue')}')"
    log "ID: #{colorize(id.to_s, 'green')}"
    log '-------------------------------------'
    index_a = 0

    b.chars.each_with_index do |letter, index_b|
      log "Evaluating letter #{colorize(letter, 'light_blue')}"
      while index_a < a.length && letter != a[index_a].upcase && a[index_a].is_lower?
        index_a += 1
      end

      if a[index_a]
        log "Found letter #{colorize(a[index_a], 'yellow')} as valid candidate."
      else
        log 'Did not find a valid candidate.'
      end

      if index_a < a.length && letter == a[index_a].upcase

        # at this point, we can either pass or accept
        if a[index_a].is_lower? && index_a + 1 < a.length
          array_passing_letter = a.slice(index_a + 1, a.size - 1)

          if has_letter_again?(array_passing_letter, a[index_a])
            log "Trying to pass letter '#{colorize(a[index_a], 'yellow')}'..."
            result = abbr?(array_passing_letter, b.slice(index_b, b.size), id + 1)

            if result
              log 'Successful pass'
              return true
            else
              log "#{colorize('Failed', 'red')} to pass letter #{colorize(a[index_a], 'yellow')}"
              log '-------------------------------------'
              log ''
              log "[We are back to #{colorize('abbr?', 'green')}('#{colorize(a, 'yellow')}', '#{colorize(b, 'light_blue')}')]"
              log "ID: #{colorize(id.to_s, 'green')}"
            end
          else
            log "It does not have any more #{colorize(a[index_a], 'red')}"
          end
        end

        log "Using upcase version of #{colorize(a[index_a], 'yellow')}"
        index_a += 1
        # next

        # puts b.size.to_s.blue
      else
        return false
      end
    end

    can_cut_remainder?(a, index_a)
  end

  def has_letter_again?(array, letter)
    array.match(/#{letter}|#{letter.upcase}/)
  end
end

class String
  def is_upper?
    self == self.upcase
  end

  def is_lower?
    self == self.downcase
  end
end
