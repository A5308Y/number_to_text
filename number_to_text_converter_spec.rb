require './number_to_text_convert.rb'

describe NumberToTextConverter do
  describe '#convert' do
    it 'returns a string' do
      NumberToTextConverter.convert(123.12).should be_a(String)
    end

    it 'converts 10' do
      NumberToTextConverter.convert(10).should == 'Zehn'
    end

    it 'converts 8' do
      NumberToTextConverter.convert(8).should == 'Acht'
    end

    it 'converts 23' do
      NumberToTextConverter.convert(23).should == 'Dreiundzwanzig'
    end

    it 'converts 55' do
      NumberToTextConverter.convert(55).should == 'Fünfundfünfzig'
    end

    it 'converts 897' do
      NumberToTextConverter.convert(897).should == 'Achthundertsiebenundneunzig'
    end

    it 'converts 8923' do
      NumberToTextConverter.convert(8977).should == 'Achttausendneunhundertsiebenundsiebzig'
    end

    it 'converts 1001' do
      NumberToTextConverter.convert(1001).should == 'Eintausendeins'
    end

    it 'converts 2044' do
      NumberToTextConverter.convert(2044).should == 'Zweitausendvierundvierzig'
    end

    it 'converts 65032' do
      NumberToTextConverter.convert(65032).should == 'Fünfundsechzigtausendzweiunddreißig'
    end

    it 'converts 72.12' do
      NumberToTextConverter.convert(72.12).should == 'Zweiundsiebzig Komma eins-zwei'
    end

    it 'converts 23472.800923' do
      NumberToTextConverter.convert(23472.800923).should == 'Dreiundzwanzigtausendvierhundertzweiundsiebzig Komma acht-null'
    end

    it 'converts 0.11' do
      NumberToTextConverter.convert(0.11).should == 'Null Komma eins-eins'
    end

    it 'converts 11.00' do
      NumberToTextConverter.convert(11.00).should == 'Elf'
    end
  end
end
