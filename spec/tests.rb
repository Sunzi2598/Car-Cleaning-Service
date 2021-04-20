require_relative '/Users/Sunzi/Desktop/CarCleaningService/CarCleaningService.rb'

describe 'one car, all workers available' do
  context 'leave it today, take it today' do
    it 'print Tuesday 20-04-2021 16:30' do
      service = Service.new
      now = Time.new(2021,04,20,14,30)
      allow(Time).to receive(:now).and_return(now)
      expect(service.add_car).to eq 'Tuesday 20-04-2021 16:30'
    end
  end
  context 'leave it today, take it tomorow' do
    it 'print Wednesday 21-04-2021 08:30' do
      service = Service.new
      now=Time.new(2021,04,20,18,30)
      allow(Time).to receive(:now).and_return(now)
      expect(service.add_car).to eq 'Wednesday 21-04-2021 08:30'
    end
  end
end

describe "six cars" do
    it 'print Wednesday 21-04-2021 08:30 for the last car' do
      service = Service.new
      now = Time.new(2021,04,20,14,30)
      allow(Time).to receive(:now).and_return(now)
      expect(service.add_car).to eq 'Tuesday 20-04-2021 16:30'
      expect(service.add_car).to eq 'Tuesday 20-04-2021 16:30'
      expect(service.add_car).to eq 'Tuesday 20-04-2021 18:30'
      expect(service.add_car).to eq 'Tuesday 20-04-2021 18:30'
      expect(service.add_car).to eq 'Wednesday 21-04-2021 08:30'
      expect(service.add_car).to eq 'Wednesday 21-04-2021 08:30'
    end
end

