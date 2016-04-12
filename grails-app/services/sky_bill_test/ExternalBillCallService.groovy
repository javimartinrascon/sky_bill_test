/**
 * Created by javier-martin
 * on 12/04/16 - 20:58.
 */
package sky_bill_test

import wslite.rest.RESTClient
import wslite.rest.Response

class ExternalBillCallService {

    static transactional = false

    String skyTestUrl = 'http://safe-plains-5453.herokuapp.com/bill.json'

    Map getRequestBillJSON() {
        Response response = callToEndpoint
        response.json
    }

    private Response getCallToEndpoint() {
        RESTClient client = new RESTClient(skyTestUrl)
        Response response = client.get()
        return response
    }
}
