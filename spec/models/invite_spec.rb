require 'rails_helper'

RSpec.describe Invite, type: :model do
  context 'check for validations for invite' do
    it 'return false if user_id is not provided' do
      u1 = User.create(name: 'Henry')
      User.create(name: 'james')
      e = Event.create(date: '20/11/2021', discription: 'home', creator_id: u1.id)
      expect(Invite.create(event_id: e.id)).to_not be_valid
    end

    it 'return true if user_id and event_id is provided' do
      u1 = User.create(name: 'Henry')
      u2 = User.create(name: 'james')
      e = Event.create(date: '20/11/2021', discription: 'home', creator_id: u1.id)
      expect(Invite.create(event_id: e.id, user_id: u2.id)).to be_valid
    end

    it 'return false if user did not accept invite' do
      u1 = User.create(name: 'Henry')
      u2 = User.create(name: 'james')
      e = Event.create(date: '20/11/2021', discription: 'home', creator_id: u1.id)
      i = Invite.create(event_id: e.id, user_id: u2.id)
      expect(i.attendence).to eq(false)
    end

    it 'return true if user accept invite' do
      u1 = User.create(name: 'Henry')
      u2 = User.create(name: 'james')
      e = Event.create(date: '20/11/2021', discription: 'home', creator_id: u1.id)
      i = Invite.create(event_id: e.id, user_id: u2.id)
      i.attendence = true
      i.save
      expect(i.attendence).to eq(true)
    end
  end
end
