/**
 * Created by javier-martin 
 * on 19/04/16 - 20:00.
 */
package pages

import geb.Page

class IndexBillPage extends Page {
    static url = '/sky_bill_test'

    static at = { title == 'index bill' }

    static content = {
        redirectToShow(to: ShowBillPage) { $("a", text: "Show your bill") }
    }
}
