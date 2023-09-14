require './author'
require './item'

describe Author do
  context "When testing the Author class" do
    it "Don't add the item if it's not an instance" do
      author = Author.new('Juan', 'Gabriel')
      item = 'Hello World :D'
      author.add_item(item)

      expect(author.items.empty?).to be true
    end

    it "Add 1 item" do
      author = Author.new('Stephen', 'King')
      item = Item.new('Horror', author, 'It', '15/09/1986')
      author.add_item(item)

      expect(author.items.length).to eq 1
    end

    it 'Add 30 items' do
      author = Author.new('Larry', 'King')
      (1986...2016).each do |year|
        item = Item.new('Fiction', author, 'Title', "24/05/#{year}")
        author.add_item(item)
      end
      expect(author.items.length).to eq 30
    end
  end
end
