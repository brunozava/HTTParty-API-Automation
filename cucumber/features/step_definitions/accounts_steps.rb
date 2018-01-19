Given("Customer informs registration data") do |table|
    @request = table.rows_hash
    remove_account(@request)
end

Given("This customer is already registered") do
    @result = HTTParty.post(
        'http://nbooks.herokuapp.com/api/accounts',
        body: @request.to_json
    )

    #We can use the following statement also
    #steps %{
    #    When I make a POST request using the account service
    #}
end
  
When("I make a POST request using the account service") do
    @result = HTTParty.post(
        'http://nbooks.herokuapp.com/api/accounts',
        body: @request.to_json
    )
end
  
Then("Response code should be {string}") do |status_code|
    expect(@result.response.code).to eql status_code
end
  
Then("Should be displayed a JSON with the message:") do |message|
    expect(@result.parsed_response['message']).to eql message
end