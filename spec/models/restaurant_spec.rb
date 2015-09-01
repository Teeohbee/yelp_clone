require 'spec_helper'

describe Restaurant, type: :model do
  it {is_expected.to have_many :reviews}

  describe 'restaraunt review association' do
    let!(:kfc) { Restaurant.create(name: 'KFC') }
      it 'deletes the review when the restaurant is deleted' do
        kfc.reviews.create(thoughts: 'great', rating: 5)
        expect{ kfc.destroy }.to change{ Review.count }
    end
  end
end
