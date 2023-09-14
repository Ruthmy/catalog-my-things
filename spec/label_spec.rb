require_relative '../label'

RSpec.describe Label do
  before do
    allow_any_instance_of(Label).to receive(:items).and_return([])
    allow_any_instance_of(Label).to receive(:add_item) do |instance, item|
      items = instance.items
      items << item
      allow(item).to receive(:label).and_return(instance)
    end
  end

  describe '#initialize' do
    it 'initializes with a title and a random id' do
      label = Label.new("Test")

      expect(label.title).to eq("Test")
      expect(label.id).to be_between(1, 1000)
    end
  end

  describe '#add_item' do
    it 'adds an item to the items list and sets the label of the item' do
      label = Label.new("Test")
      item = double('Item')

      label.add_item(item)

      expect(item.label).to eq(label)
    end
  end

  describe '#items' do
    it 'returns a list of items' do
      label = Label.new("Test")
      item1 = double('Item1')
      item2 = double('Item2')

      label.add_item(item1)
      label.add_item(item2)

      expect(label.items).to eq([item1, item2])
    end
  end
end
