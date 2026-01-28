# frozen_string_literal: true

RSpec.describe FunTranslations::Client do
  let(:text) { 'Master Obi Wan lost a planet' }
  let(:translated) { 'A planet, master Obi Wan lost' }
  let(:response_body) do
    {
      success: { total: 1 },
      contents: {
        translated: translated,
        text: text,
        translation: 'yoda'
      }
    }
  end

  describe '#translate' do
    context 'without token' do
      it 'translates as yoda' do
        stub_request(:post, 'https://api.funtranslations.com/translate/yoda.json')
          .with(body: { text: text })
          .to_return(
            status: 200,
            body: JSON.dump(response_body)
          )

        translation = test_client.translate :yoda, text

        expect(translation).to be_an_instance_of(FunTranslations::Translation)
        expect(translation.translated_text).to eq(translated)
        expect(translation.original_text).to eq(text)
        expect(translation.translation).to eq('yoda')
      end

      it 'translates as morse audio' do
        text = 'Welcome'
        audio = 'data:audio/wave;base64,UklGRjiBCQBXQVZFZm1'
        data = {
          success: { total: 1 },
          contents: {
            translated: { audio: audio },
            text: text,
            translation: {
              source: 'english',
              destination: 'morse audio'
            }
          }
        }

        stub_request(
          :post,
          'https://api.funtranslations.com/translate/morse/audio.json'
        )
          .with(body: { text: text })
          .to_return(
            status: 200,
            body: JSON.dump(data)
          )

        translation = test_client.translate 'morse/audio', text

        expect(translation).to be_an_instance_of(FunTranslations::Translation)
        expect(translation.audio).to eq(audio)
        expect(translation.original_text).to eq(text)
        expect(translation.translation[:destination]).to eq('morse audio')
      end
    end

    it 'translates as yoda with token' do
      stub_request(
        :post,
        'https://api.funtranslations.com/translate/yoda.json'
      )
        .with(
          body: { text: text },
          headers: {
            'X-Funtranslations-Api-Secret' => 'my token',
            'Content-Type' => 'application/x-www-form-urlencoded',
            'User-Agent' => "fun_translations gem/#{FunTranslations::VERSION}"
          }
        )
        .to_return(
          status: 200,
          body: JSON.dump(response_body)
        )

      translation = test_client('my token').translate :yoda, text

      expect(translation).to be_an_instance_of(FunTranslations::Translation)
      expect(translation.translated_text).to eq(translated)
      expect(translation.original_text).to eq(text)
      expect(translation.translation).to eq('yoda')
    end
  end
end
