/**
 * Created by javier-martin
 * on 15/04/16 - 20:49.
 */

import geb.spock.GebReportingSpec
import pages.IndexBillPage
import pages.ShowBillPage

class BillShowSpec extends GebReportingSpec {

    void "test index redirect"() {
        when:
        to IndexBillPage

        and:
        redirectToShow.click()

        then:
        at ShowBillPage

    }

}

