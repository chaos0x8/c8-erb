gem 'bundler'

require 'bundler'

Bundler.require(:default, :development)

describe(C8) {
  it('evaluates template') {
    result = C8.erb ({}), <<-INLINE
      <%= 42 * 2 %>
    INLINE

    expect(result.strip).to eq('84')
  }

  it('evaluates template with arguments') {
    result = C8.erb ({ val: 42 }), "Value = <%= @val %>"

    expect(result).to eq("Value = 42")
  }
}
