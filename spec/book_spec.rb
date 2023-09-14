require_relative '../book'

describe Book do
  describe '#initialize' do
    # cria um novo objeto book com atributos específicos
    let(:book) { Book.new({ genre: 'Fiction', author: 'John Doe', label: 'TestLabel', publish_date: '2023', cover_state: 'good', publisher: 'TestPub' }) }

    it 'should correctly initialize a book' do
        # verifique se os atributos do objeto book correspondem aos valores esperados
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
        # crie um objeto de teste book em que can_be_arch retorna true
      let(:book) { instance_double(Book, can_be_archived?: true, cover_state: 'good') }

      it 'returns true' do
        # verifique se o método can_be? retorna true
        expect(book.can_be_archived?).to eq(true)
      end
    end

    context 'when cover_state is bad' do
        # crie um novo objeto 'book' com capa definido como bad
      let(:book) { Book.new({ genre: 'Fiction', author: 'John Doe', label: 'TestLabel', publish_date: '2023', cover_state: 'bad', publisher: 'TestPub' }) }

      it 'returns true' do
        # verifique se o método 'can_be?' retorna true
        expect(book.can_be_archived?).to eq(true)
      end
    end

    context 'when cover_state is not bad and super returns false' do
         # crie um novo objeto 'book' com capa definido como good.
      let(:book) { Book.new({ genre: 'Fiction', author: 'John Doe', label: 'TestLabel', publish_date: '2023', cover_state: 'good', publisher: 'TestPub' }) }
      
      # assumindo que a parent class's can_be_archived? retornaria falso <<<<<
      it 'returns false' do
        expect(book.can_be_archived?).to eq(false)
      end
    end
  end
end