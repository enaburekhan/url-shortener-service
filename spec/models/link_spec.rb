require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'is valid if it has an original URL and a lookup code' do
    link = Link.new(
      original_url: 'https://medium.com/@sandeep4.verma/system-design-scalable-url-shortener/how-to-code',
      lookup_code: '12345678'
    )
    expect(link.valid?).to be(true)
  end

  it 'is invalid if it does not have a lookup code' do
    link = Link.new(
      original_url: 'https://medium.com/@sandeep4.verma/system-design-scalable-url-shortener/how-to-code'
    )
    expect(link.valid?).to be(false)
  end

  it 'is invalid if it does not have an original url' do
    link = Link.new(
      lookup_code: '12345678'
    )
    expect(link.valid?).to be(false)
  end

  it 'is invalid if the lookup code already exist' do
    link = Link.new(
      original_url: 'https://medium.com/@sandeep4.verma/system-design-scalable-url-shortener/how-to-code',
      lookup_code: '12345678'
    )
    link.save

    link_2 = Link.new(
      original_url: 'https://medium.com/@sandeep4.verma/system-design-scalable-url-shortener/how-to-drive',
      lookup_code: '12345678'
    )
    expect(link_2.valid?).to be(false)
  end
end
