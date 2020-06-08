require 'entry'

describe Entry do

  describe '.all' do
    it 'shows all my diary entries' do
      connection = PG.connect(dbname: 'daily_diary_test')
 
      entry = Entry.add(title: "My first entry", body: "feeling :)")
      Entry.add(title: "My second entry", body: "feeling :|")

      entries = Entry.all

      expect(entries.length).to eq 2
      expect(entries.first).to be_a Entry
      expect(entries.first.id).to eq Entry.id
      expect(entries.first.title).to eq "My first entry"
      expect(entries.first.body).to eq "feeling :)"
    end
  end

    describe '.add' do
      it 'allows me to add a diary entry' do
        Entry.add(title: "Testing a new title")
        expect(Entry.all).to include 'Testing a new title'
      end
    end

    #not working
    describe '.#last_entry' do
      it 'retrives last entry title' do
        Entry.add(title: "Testing a new title_1")
        Entry.add(title: "Testing a new title_2").to_s
        expect(Entry.last_entry).to eq("Testing a new title_2")
      end
    end 
end
