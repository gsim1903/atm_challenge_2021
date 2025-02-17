require './lib/account.rb'
RSpec.describe Account do
  subject { described_class.new({ owner: person }) }
  let(:person) { instance_double('Person', name: 'Thomas') }

  it 'is expected to check the length of a number' do
    number = 1234
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.set_exp_date).to eq expected_date
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  #it 'is expected to deactivate the account using the class method' do
  # Account.deactivate(subject)
  #expect(subject.account_status). to eq :deactivated
  #end

  it 'is expected to deactivate the account using the instance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end

  it 'is expected to raise error if no owner is set' do
    expect { described_class.new }.to raise_error 'An Account owner is required'
  end
end
