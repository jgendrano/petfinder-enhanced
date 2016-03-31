require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:username).when('Foo', 'Bar') }
  it { should_not have_valid(:username).when(nil, '')}

  it { should have_valid(:email).when('user@example.com', 'foo@bar.com')}
  it { should_not have_valid(:email).when(nil, '', 'user', 'foo@bar', 'google.com')}

  it 'has a matching password confirmation' do
    user = User.new
    user.password = "password"
    user.password_confirmation = "Password$"

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
