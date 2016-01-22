describe Wit::Result do
  let(:text) {'un bar près de paris?'}

  subject do
    Wit::Client.new($token).classify_message(text)
  end

  context "standard request with all the type of contents", vcr: {cassette_name: 'standard_request'} do
    it "sets the id" do
      expect(subject.id).not_to be_nil
    end

    it "sets the text" do
      expect(subject.text).to eq text
    end

    it "sets the intent" do
      expect(subject.intent).to eq "Location"
    end

    it "sets the confidence" do
      expect(subject.confidence).to be > 0
    end

    context "for each entities" do
      let (:entities) {subject.entities}

      it "contains a value" do
        expect(entities["location"].first.value).to eq "paris"
      end
    end
  end

  context "request without entities", vcr: {cassette_name: 'empty_entities_request'} do
    let(:text) {"non je n'aime pas les pommes"}

    it "doesn't fail" do
      subject
    end

    it "has an empty entities array" do
      expect(subject.entities).to be_truthy
    end
  end
end
