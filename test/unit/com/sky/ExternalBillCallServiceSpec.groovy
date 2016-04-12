/**
 * Created by javier-martin
 * on 12/04/16 - 20:58.
 */
package com.sky

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll
import wslite.http.HTTPRequest
import wslite.http.HTTPResponse
import wslite.rest.Response

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(ExternalBillCallService)
class ExternalBillCallServiceSpec extends Specification {

    @Unroll
    void "tests external response"() {

        when:
        service.metaClass.getCallToEndpoint() { -> return mockedResponse }
        def result = service.requestBillJSON

        then:
        result == expected

        where:
        mockedResponse               | expected
        mockedOKEndpointResponse()   | JSON_MAP
        mockedFailEndpointResponse() | null
    }

    private Response mockedOKEndpointResponse() {
        HTTPRequest httpRequest = new HTTPRequest()
        HTTPResponse httpResponse = new HTTPResponse(statusMessage: 'OK', contentType: 'application/json')
        Response responseEndpoint = new Response(httpRequest, httpResponse)
        responseEndpoint.parsedResponseContent = [text: JSON_TEXT, json: JSON_MAP]
        responseEndpoint
    }

    private Response mockedFailEndpointResponse() {
        HTTPRequest httpRequest = new HTTPRequest()
        HTTPResponse httpResponse = new HTTPResponse()
        Response responseEndpoint = new Response(httpRequest, httpResponse)
        responseEndpoint
    }

    static final JSON_TEXT = "{'mock': {'info': 'fake'}, 'total': '23.00', 'other': {'more': 'fake'}}"
    static final JSON_MAP = [mock: [info: 'fake'], total: 23.00, other: [more: 'fake']]
}
