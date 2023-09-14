require_relative '../book'

describe Book do
  describe '#initialize' do
    let(:book) { Book.new({ genre: 'Fiction', author: 'John Doe', label: 'TestLabel', publish_date: '2023', cover_state: 'good', publisher: 'TestPub' }) }

    it 'should correctly initialize a book' do
      expect(book.genre).to eq('Fiction')
      expect(book.author).to eq('John Doe')
      expect(book.label).to eq('TestLabel')
      expect(book.publish_date).to eq('2023')
      expect(book.cover_state).to eq('good')
      expect(book.publisher).to eq('TestPub')
    end
  end

  describe '#can_be_archived?' do
    context 'when super returns true' do
      let(:book) { instance_double(Book, can_be_archived?: true, cover_state: 'good') }

      it 'returns true' do
        expect(book.can_be_archived?).to eq(true)
      end
    end

    context 'when cover_state is bad' do
      let(:book) { Book.new({ genre: 'Fiction', author: 'John Doe', label: 'TestLabel', publish_date: '2023', cover_state: 'bad', publisher: 'TestPub' }) }

      it 'returns true' do
        expect(book.can_be_archived?).to eq(true)
      end
    end

    context 'when cover_state is not bad and super returns false' do
      let(:book) { Book.new({ genre: 'Fiction', author: 'John Doe', label: 'TestLabel', publish_date: '2023', cover_state: 'good', publisher: 'TestPub' }) }
      
      it 'returns false' do
        expect(book.can_be_archived?).to eq(false)
      end
    end
  end
end