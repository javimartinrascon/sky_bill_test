/**
 * Created by javier-martin
 * on 12/04/16 - 20:58.
 */
package com.sky

import com.sky.utils.ConfigResolver
import wslite.rest.RESTClient
import wslite.rest.Response

class ExternalBillCallService {

    static transactional = false

    private String skyTestUrl = ConfigResolver.config.sky.test.url

    Map getRequestBillJSON() {
        Response response = callToEndpoint
        response?.json
    }

    private Response getCallToEndpoint() {
        RESTClient client = new RESTClient(skyTestUrl)
        Response response
        try {
            response = client.get()
        } catch (Exception e) {
            log.error("Error getting info from endpoint: ${skyTestUrl}")
        }
        response
    }
}
