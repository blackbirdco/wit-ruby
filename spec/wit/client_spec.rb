describe Wit::Client do

  subject do
    Wit::Client.new(token).classify_message("test")
  end

  let(:token) {$token}

  context "happy path", vcr: {cassette_name: 'happy_path'} do
    it "initializes a result" do
      expect(Wit::Result).to receive(:new)
      subject
    end
  end

  context "bad token", vcr: {cassette_name: 'bad_token'} do
    let(:token) {'1234'}
    it "raises Unauthorized" do
      expect{subject}.to raise_exception(Wit::BadResponse, "response code: 400")
    end
  end

  context "other error", vcr: {cassette_name: 'no_token'} do
    let(:token) {nil}
    it "raises a BadResponse with its code" do
      expect{subject}.to raise_exception(Wit::BadResponse, "response code: 400")
    end
  end
end
