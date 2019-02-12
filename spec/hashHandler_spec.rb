require_relative '../app/lib/hashHandler.rb'

describe HashHandler do
  it { is_expected.to respond_to :to_hash}
  it "converts a password into a hash" do
    new_hash = subject.to_hash("hithere")
    expect(new_hash).to_not eq("hithere")
  end
  it "can authenticate a password" do
    password = "hidude"
    pass_hash = subject.to_hash("hidude")
    expect(password).to_not eq(pass_hash)
    expect(subject.authenticate("hidude", pass_hash)).to eq(true)
    expect(subject.authenticate("ohdude", pass_hash)).to eq(false)
  end
end
