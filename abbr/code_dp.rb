#!/bin/ruby
require 'byebug'
require 'colorize'

# https://www.hackerrank.com/challenges/abbr/problem
class Abbreviation
  def abbreviation(a, b)
      # Multi-dimensional array with a's input characters on the X-axis
      # and b's match string characters on the Y-axis. Padded row and column
      # for initial states
      dp = Array.new(b.size + 1) { Array.new(a.size + 1, false) }

      # Starting cell in top-left is TRUE, rest are FALSE
      dp[0][0] = true

      # Initialize top row to TRUE for any downcase letters
      (1..dp[0].size - 1).each do |j|
        dp[0][j] = true if a[j - 1].downcase == a[j - 1]
      end

      # For each cell in the matrix, ignoring the padded top row and left column
      (1..dp.size - 1).each do |i|
        (1..dp[0].size - 1).each do |j|
          ca = a[j - 1]
          cb = b[i - 1]

          # If characters are both uppercase and match, take top-left cell
          # If characters are mixed case and match, take true from top-left or left
          # If characters don't match, take left cell
          if ca.upcase == ca
              dp[i][j] = dp[i - 1][j - 1] if ca == cb
          else
              dp[i][j] = ca.upcase == cb ? (dp[i - 1][j - 1] || dp[i][j - 1]) : dp[i][j - 1]
          end
        end
      end

      if ENV['DEBUG']
        dp.each do |r|
          p r
        end
      end

      # Return the bottom-right cell
      dp[-1][-1] ? 'YES' : 'NO'
  end
end
