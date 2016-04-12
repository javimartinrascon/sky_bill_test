/**
 * Created by javier-martin
 * on 12/04/16 - 20:47.
 */
package sky_bill_test

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(BillController)
class BillControllerSpec extends Specification {

    @Unroll
    void "tests show method response from controller"() {
        given:
        controller.externalBillCallService = businessService

        expect:
        controller.show() == expected

        where:
        businessService            | expected
        mockRightBusinessService() | [model: RIGHT_RESPONSE]
        mockWrongBusinessService() | [model: null]
    }

    private mockRightBusinessService() {
        GroovyMock(ExternalBillCallService){
            getRequestBillJSON() >> RIGHT_RESPONSE
        }
    }

    private mockWrongBusinessService() {
        GroovyMock(ExternalBillCallService){
            getRequestBillJSON() >> null
        }
    }

    static final LinkedHashMap<String, Boolean> RIGHT_RESPONSE = [ok: true]
}
