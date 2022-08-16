Feature: CodeTest at EA

  Background:
    Given url baseUrl
    #    Read the response schema from file
    * def successResponseSchema = read ('response_schema/successResponseSchema.json')

  @test
  Scenario: Verify the API returns 200 success response
    Given path '/festivals'
    When method get
    # Test Assertions
    * print 'Response is --------', response
    Then status 200
    # Validate response body
    * string expectedResponseSchema = successResponseSchema
    * string actualResponse = response
    * def SchemaUtils = Java.type('util.JSONSchemaUtil')
    * assert SchemaUtils.isValid(actualResponse, expectedResponseSchema)
    # Validate response headers
    * def responseHeaders = karate.lowerCase(responseHeaders)
    * def contentType = karate.get("responseHeaders['content-type'][0]")
    * print 'contentType is --------', contentType
    Then assert contentType == 'application/json; charset=utf-8'
    * match header Date != null
    * match header Connection != null
