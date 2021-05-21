require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'scope testing' do
    before do
      user = User.create(name: 'henry')
      @event1 = user.events.create(discription: 'party', date: '05-05-2020')
      @event2 = user.events.create(discription: 'party', date: '05-05-2022')
    end
    it 'should reture only past event' do
      expect(Event.past_events.first).to eq(@event1)
    end
    it 'should reture only past event' do
      expect(Event.upcoming_events.first).to eq(@event2)
    end
    it 'should not craete event without user'do
    @event2 = Event.create(discription: 'party', date: '05-05-2022')
    expect(@event2).to_not be_valid
  end
  end
end
