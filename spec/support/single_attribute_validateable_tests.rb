shared_examples "single attribute validateable" do |klass, attribute, value, error_message|
   
  it "should return error message: #{error_message}" do
    expect(klass.validate_attribute(attribute, value)).to eq(error_message)
  end

end
