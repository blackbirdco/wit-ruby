describe Wit do
  it "defines 2 exceptions classes" do
    expect do
      Wit::Unauthorized.new
      Wit::BadResponse.new
    end.not_to raise_exception
  end
end
