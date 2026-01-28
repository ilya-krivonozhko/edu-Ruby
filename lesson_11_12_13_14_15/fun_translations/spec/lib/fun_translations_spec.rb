# frozen_string_literal: true

RSpec.describe FunTranslations do
  describe '.client' do
    it 'creates client without token' do
      client = described_class.client
      expect(client).to be_an_instance_of(described_class::Client)
      expect(client.token).to be_nil
    end

    it 'creates client with token' do
      client = described_class.client('token')
      expect(client.token).to be_an_instance_of(String)
      expect(client.token).to eq('token')
    end
  end

  describe 'VERSION' do
    it 'is a valid gem version' do
      expect(FunTranslations::VERSION).to be_a(String)
      expect { Gem::Version.new(FunTranslations::VERSION) }.not_to raise_error
    end
  end
end
