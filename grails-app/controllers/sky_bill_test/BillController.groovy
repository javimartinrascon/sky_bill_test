/**
 * Created by javier-martin
 * on 12/04/16 - 20:47.
 */
package sky_bill_test

class BillController {

    def show() {
        def billJson = [ok: true]
        [model: billJson]
    }
}
