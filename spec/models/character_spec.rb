describe Character do
  it 'should work' do
    c = Character.create! body: { foo: 'bar' }
    expect(c.body['foo']).to eq('bar')
  end
end
