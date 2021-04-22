require_relative '/Users/Sunzi/Desktop/CarCleaningService/Service.rb'

describe 'one car' do
  subject {service = Service.new}
  
  context 'when the car needs to be picked up today' do
    before {allow(Time).to receive(:now).and_return(Time.new(2021,04,20,14,30))}
    
    it 'print Tuesday 20-04-2021 16:30' do
      expect(subject.add_car).to eq 'Tuesday 20-04-2021 16:30'
    end
  end
  
  context 'when the car needs to be picked up tomorow' do
    before {allow(Time).to receive(:now).and_return(Time.new(2021,04,20,18,30))}
    
    it 'print Wednesday 21-04-2021 08:30' do
      
      expect(subject.add_car).to eq 'Wednesday 21-04-2021 08:30'
    end
  end
  
  context 'when the car needs to be picked up tomorow and tomorow is saturday' do
    before {allow(Time).to receive(:now).and_return(Time.new(2021,04,23,18,30))}
    
    it 'print Saturday 24-04-2021 10:30' do
      
      expect(subject.add_car).to eq 'Saturday 24-04-2021 10:30'
    end
  end
  
  context 'when the car needs to be picked up today and it is saturday' do
    before {allow(Time).to receive(:now).and_return(Time.new(2021,04,24,10,30))}
    
    it 'print Saturday 24-04-2021 12:30' do
      
      expect(subject.add_car).to eq 'Saturday 24-04-2021 12:30'
    end
  end
    
  context 'when the car needs to be picked up tomorow and it is saturday' do
    before {allow(Time).to receive(:now).and_return(Time.new(2021,04,24,14,30))}
    
    it 'print Monday 26-04-2021 08:30' do
      
      expect(subject.add_car).to eq 'Monday 26-04-2021 08:30'
    end
  end  
end

describe "six cars" do
    before {allow(Time).to receive(:now).and_return(Time.new(2021,04,20,14,30))}
    subject {service = Service.new}
    
    it 'print Wednesday 21-04-2021 08:30 for the last car' do
      
      expect(subject.add_car).to eq 'Tuesday 20-04-2021 16:30'
      expect(subject.add_car).to eq 'Tuesday 20-04-2021 16:30'
      expect(subject.add_car).to eq 'Tuesday 20-04-2021 18:30'
      expect(subject.add_car).to eq 'Tuesday 20-04-2021 18:30'
      expect(subject.add_car).to eq 'Wednesday 21-04-2021 08:30'
      expect(subject.add_car).to eq 'Wednesday 21-04-2021 08:30'
    end
end

describe "twenty cars" do
    before {allow(Time).to receive(:now).and_return(Time.new(2021,04,23,8,30))}
    subject {service = Service.new}
    
    it 'print Monday 26-04-2021 10:30 for the last car' do
      
      expect(subject.add_car).to eq 'Friday 23-04-2021 10:30'
      expect(subject.add_car).to eq 'Friday 23-04-2021 10:30'
      expect(subject.add_car).to eq 'Friday 23-04-2021 12:30'
      expect(subject.add_car).to eq 'Friday 23-04-2021 12:30'
      expect(subject.add_car).to eq 'Friday 23-04-2021 14:30'
      expect(subject.add_car).to eq 'Friday 23-04-2021 14:30'
      expect(subject.add_car).to eq 'Friday 23-04-2021 16:30'
      expect(subject.add_car).to eq 'Friday 23-04-2021 16:30'
      expect(subject.add_car).to eq 'Friday 23-04-2021 18:30'
      expect(subject.add_car).to eq 'Friday 23-04-2021 18:30'
      expect(subject.add_car).to eq 'Saturday 24-04-2021 10:30'
      expect(subject.add_car).to eq 'Saturday 24-04-2021 10:30'
      expect(subject.add_car).to eq 'Saturday 24-04-2021 12:30'
      expect(subject.add_car).to eq 'Saturday 24-04-2021 12:30'
      expect(subject.add_car).to eq 'Saturday 24-04-2021 14:30'
      expect(subject.add_car).to eq 'Saturday 24-04-2021 14:30'
      expect(subject.add_car).to eq 'Monday 26-04-2021 08:30'
      expect(subject.add_car).to eq 'Monday 26-04-2021 08:30'
      expect(subject.add_car).to eq 'Monday 26-04-2021 10:30'
      expect(subject.add_car).to eq 'Monday 26-04-2021 10:30'
    end
end

