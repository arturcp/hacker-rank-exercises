#!/bin/ruby
require 'byebug'
require 'colorize'

# https://www.hackerrank.com/challenges/abbr/problem
class Abbreviation
  def abbreviation(a, b)
    abbr?(a, b) ? 'YES' : 'NO'
  end

  private

  def log(text)
    return unless ENV['DEBUG']

    puts text
  end

  def can_cut_remainder?(a, index_a)
    log "can_cut_remainder? index: #{index_a} a: #{a.inspect}"
    return false if index_a > a.length

    text = a.slice(index_a, a.length - index_a)
    log text
    text == text.downcase
  end

  def abbr?(a, b)
    log ''
    log "#{'abbr?'.green}('#{a.yellow}', '#{b.light_blue}')"
    log '-------------------------------------'
    index_a = 0

    b.chars.each_with_index do |letter, index_b|
      log "Evaluating letter #{letter.light_blue}"
      while index_a < a.length && letter != a[index_a].upcase && a[index_a].is_lower?
        index_a += 1
      end

      if a[index_a]
        log "Found letter #{a[index_a].yellow} as valid candidate."
      else
        log 'Did not find a valid candidate.'
      end

      if index_a < a.length && letter == a[index_a].upcase

        # at this point, we can either pass or accept
        if a[index_a].is_lower? && index_a + 1 < a.length
          array_passing_letter = a.slice(index_a + 1, a.size - 1)
          log "Trying to pass letter '#{a[index_a].yellow}'..."
          result = abbr?(array_passing_letter, b.slice(index_b, b.size))

          if result
            log 'Successful pass'
            return true
          else
            log "#{'Failed'.red} to pass letter #{a[index_a].yellow}"
            log '-------------------------------------'
            log ''
            log "[We are back to #{'abbr?'.green}('#{a.yellow}', '#{b.light_blue}')]"
          end
        end

        log "Trying to use upcase version of #{a[index_a].yellow}"
        index_a += 1
        next
      else
        return false
      end
    end

    can_cut_remainder?(a, index_a)
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
