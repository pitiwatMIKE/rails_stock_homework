RSpec.describe User do
  describe "sign in" do
    context "when email and password is valid" do
      subject { described_class.new(email: "john@gmail.com", password: "123456") }
      it "should return true" do
        expect(subject.valid?).to be true
      end
    end

    context "when email is invalid" do
      subject { described_class.new(email: "john", password: "123456") }
      it "should return false" do
        expect(subject.valid?).to be false
      end
    end

    context "when password is invalid" do
      subject { described_class.new(email: "john@gmail", password: "1234") }
      it "should return false" do
        expect(subject.valid?).to be false
      end
    end
  end

  describe "sign up" do
    context "when passwrod is match" do
      subject { described_class.new(email: "john@gmail.com", password: "123456", password_confirmation: "123456") }
      it "should return true" do
        expect(subject.valid?).to be true
      end
    end

    context "when passwrod is match" do
      subject { described_class.new(email: "john@gmail.com", password: "123456", password_confirmation: "122452") }
      it "should return false" do
        expect(subject.valid?).to be false
      end
    end
  end
end
