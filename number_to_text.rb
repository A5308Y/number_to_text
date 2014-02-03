#See http://www.calculino.com/de/umrechnungen/zahlen-in-worten_information.html

class NumberToTextConverter
  def self.convert(float)
    integer = float.to_i
    if integer > 1100
      "xx-#{number_to_words(integer)}-xx"
    else
      convert_below_million(integer)
    end
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
      result = crop_one(convert_below_twenty[hundreds].to_s) + 'hundert'
      result += convert_below_hundred(rest).to_s unless rest == 0
      result
    end
  end

  def self.convert_below_hundred(decimal)
    text_array = []
    if decimal < 20.0
      text_array << convert_below_twenty[decimal]
    else
      tens, rest = decimal.divmod(10)
      text_array << crop_one(convert_below_twenty[rest]) unless rest == 0
      text_array << tens_to_word[tens]
    end
    text_array.join('und')
  end

  def self.convert_below_twenty
    [
      'null',
      'eins',
      'zwei',
      'drei',
      'vier',
      'fünf',
      'sechs',
      'sieben',
      'acht',
      'neun',
      'zehn',
      'elf',
      'zwölf',
      'dreizehn',
      'vierzehn',
      'fünfzehn',
      'sechzehn',
      'siebzehn',
      'achtzehn',
      'neunzehn'
    ]
  end

  def self.tens_to_word
    [
      '',
      '',
      'zwanzig',
      'dreißig',
      'vierzig',
      'fünfzig',
      'sechzig',
      'siebzig',
      'achtzig',
      'neunzig'
    ]
  end

  def self.crop_one(number)
    number == 'eins' ? 'ein' : number
  end

  def self.number_to_words(number)
    result = number.to_s.each_char.map { |digit| convert_below_twenty[digit.to_i] }
    result.join('-').to_s unless result == ['null']
  end
end
