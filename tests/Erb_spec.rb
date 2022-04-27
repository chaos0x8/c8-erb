gem 'bundler'

require 'bundler'

Bundler.require(:default, :development)

describe(C8) do
  it('evaluates template') {
    result = C8.erb({}) do
      <<~INLINE
        <%= 42 * 2 %>
      INLINE
    end

    expect(result.strip).to eq('84')
  }

  it('evaluates template with arguments') {
    result = C8.erb val: 42 do
      'Value = <%= val %>'
    end

    expect(result).to eq('Value = 42')
  }

  it('evaluate has no access to local variables') {
    local1 = 90
    local2 = 200
    x = 7

    result = C8.erb x: x do
      <<~INLINE
        <%-
          v1 = local1 rescue 10
          v2 = local2 rescue 20
          v3 = x rescue 5
        -%>
        <%= v1+v2+v3 %>
      INLINE
    end

    expect(result.strip).to eq('37')
  }
end
