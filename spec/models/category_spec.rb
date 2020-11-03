require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'an existing category' do
    subject { create(:category, title: 'Breakfast') }

    it 'updates the title' do
      expect { subject.update(title: 'Supper') }.to change { subject.title }.from('Breakfast').to('Supper')
    end
  end

  context 'a new category' do
    subject { described_class.new }

    it 'has many entries' do
      expect(subject.entries).to eq []
    end

    it 'validates the title' do
      expect(subject.valid?).to be false
      expect(subject.errors[:title]).to eq ["can't be blank"]

      subject.title = 'Breakfast'
      expect { subject.save }.to change{ Category.count }
    end
  end
end
