class NumberToTextConverter
  def self.convert(float)
    integer, decimals = float.divmod(1)
    result = [
      convert_below_million(integer),
      number_to_words((decimals * 100).to_i)
    ].compact.join(' Komma ')
    result[0].capitalize + result[1..-1]
  end

  def self.convert_below_million(decimal)
    thousands, rest = decimal.divmod(1000)
    if thousands == 0
      convert_below_thousand(rest).to_s
    else
      crop_one(convert_below_hundred(thousands).to_s) + 'tausend' + convert_below_thousand(rest).to_s
    end
  end

  def self.convert_below_thousand(decimal)
    hundreds, rest = decimal.divmod(100)
    if hundreds == 0
      convert_below_hundred(rest).to_s
    else
      crop_one(convert_below_twenty[hundreds.to_s].to_s) + 'hundert' + convert_below_hundred(rest).to_s
    end
  end

  def self.convert_below_hundred(decimal)
    text_array = []
    if decimal < 20.0
      text_array << convert_below_twenty[decimal.to_s]
    else
      tens, rest = decimal.divmod(10)
      text_array << convert_below_twenty[rest.to_s]
      text_array << tens_to_word[tens.to_s]
    end
    text_array.join('und')
  end

  def self.convert_below_twenty
    {
      '0'  => 'null',
      '1'  => 'eins',
      '2'  => 'zwei',
      '3'  => 'drei',
      '4'  => 'vier',
      '5'  => 'fünf',
      '6'  => 'sechs',
      '7'  => 'sieben',
      '8'  => 'acht',
      '9'  => 'neun',
      '10' => 'zehn',
      '11' => 'elf',
      '12' => 'zwölf',
      '13' => 'dreizehn',
      '14' => 'vierzehn',
      '15' => 'fünfzehn',
      '16' => 'sechzehn',
      '17' => 'siebzehn',
      '18' => 'achtzehn',
      '19' => 'neunzehn'
    }
  end

  def self.tens_to_word
    {
      '2' => 'zwanzig',
      '3' => 'dreißig',
      '4' => 'vierzig',
      '5' => 'fünfzig',
      '6' => 'sechzig',
      '7' => 'siebzig',
      '8' => 'achtzig',
      '9' => 'neunzig'
    }
  end

  def self.crop_one(number)
    number == 'eins' ? 'ein' : number
  end

  def self.number_to_words(number)
    result = number.to_s.each_char.map { |digit| convert_below_twenty[digit] }
    result.join('-').to_s unless result == ['null']
  end
end
