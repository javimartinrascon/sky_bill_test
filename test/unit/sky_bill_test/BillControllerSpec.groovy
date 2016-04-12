/**
 * Created by javier-martin
 * on 12/04/16 - 20:47.
 */
package sky_bill_test

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(BillController)
class BillControllerSpec extends Specification {

    static final LinkedHashMap<String, Boolean> RIGHT_RESPONSE = [ok: true]

    void "tests show method response from controller"() {
        expect:
        controller.show() == [model: RIGHT_RESPONSE]
    }
}
