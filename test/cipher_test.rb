require 'minitest'
require 'minitest/autorun'

require 'cipher'

class CipherTest < MiniTest::Test

  def setup
    @simple_cipher  = File.read(File.dirname(__FILE__) + '/fixtures/simple_cipher.txt')
    @simple_output  = File.read(File.dirname(__FILE__) + '/fixtures/simple_out.txt')
    @complex_cipher = File.read(File.dirname(__FILE__) + '/fixtures/complex_cipher.txt')
  end

  def test_caesar_cipher
    cipher = "FRZDUGV GLH PDQB WLPHV EHIRUH WKHLU GHDWKV; WKH YDOLDQW QHYHU WDVWH RI GHDWK EXW RQFH."
    output = "COWARDS DIE MANY TIMES BEFORE THEIR DEATHS; THE VALIANT NEVER TASTE OF DEATH BUT ONCE."

    assert_equal output, Cipher.caesar(cipher, 3)
  end

  def test_word_is_english
    assert Cipher.is_english?("APPLE")
  end

  def test_word_is_not_english
    refute Cipher.is_english?("GUCQY")
  end

  def test_discovering_a_ceasar_cipher_without_knowing_the_offset
    assert_equal "GARDEN", Cipher.caesar_guess("RLCOPY")
  end

  def test_simple_vigenere_cipher
    keyword, text = @simple_cipher.split("\n\n")
    assert_equal @simple_output, Cipher.vigenere(keyword, text)
  end

  def test_complex_vigenere_cipher
    keyword, text = @complex_cipher.split("\n\n")
    # @complex_ouput = ... YOUR SOLUTION
    assert_equal @complex_output, Cipher.vigenere(keyword, text)
  end
end