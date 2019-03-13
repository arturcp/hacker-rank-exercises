#!/usr/bin/env ruby
# encoding: utf-8
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'code'
require 'minitest/pride'

class BinaryTest < Minitest::Test
  def test_pi
    assert_equal 'YES', Abbreviation.new.abbreviation('Pi', 'P')
  end

  def test_AfPZN
    assert_equal 'NO', Abbreviation.new.abbreviation('AfPZN', 'APZNC')
  end

  def test_LDJAN
    assert_equal 'NO', Abbreviation.new.abbreviation('LDJAN', 'LJJM')
  end

  def test_UMKFW
    assert_equal 'YES', Abbreviation.new.abbreviation('UMKFW', 'UMKFW')
  end

  def test_KXzQ
    assert_equal 'NO', Abbreviation.new.abbreviation('KXzQ', 'K')
  end

  def test_LIT
    assert_equal 'YES', Abbreviation.new.abbreviation('LIT', 'LIT')
  end

  def test_QYCH
    assert_equal 'YES', Abbreviation.new.abbreviation('QYCH', 'QYCH')
  end

  def test_DFIQG
    assert_equal 'YES', Abbreviation.new.abbreviation('DFIQG', 'DFIQG')
  end

  def test_sYOCa
    assert_equal 'NO', Abbreviation.new.abbreviation('sYOCa', 'YOCN')
  end

  def test_JHMWY
    assert_equal 'NO', Abbreviation.new.abbreviation('JHMWY', 'HUVPW')
  end

  def test_daBcd
    assert_equal 'YES', Abbreviation.new.abbreviation('daBcd', 'ABC')
  end

  def test_aA
    assert_equal 'YES', Abbreviation.new.abbreviation('aA', 'A')
  end

  def test_bbA
    assert_equal 'YES', Abbreviation.new.abbreviation('bbA', 'BA')
  end

  def test_ab
    assert_equal 'NO', Abbreviation.new.abbreviation('ab', 'BA')
  end

  def test_aba
    assert_equal 'YES', Abbreviation.new.abbreviation('abA', 'BA')
  end

  def test_bbA
    assert_equal 'YES', Abbreviation.new.abbreviation('bbA', 'BA')
  end

  def test_bbAA
    assert_equal 'NO', Abbreviation.new.abbreviation('bbAA', 'BA')
  end

  def test_BBccC
    assert_equal 'YES', Abbreviation.new.abbreviation('BBccC', 'BBC')
  end
end
