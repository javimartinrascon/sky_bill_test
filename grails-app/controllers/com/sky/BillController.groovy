/**
 * Created by javier-martin
 * on 12/04/16 - 20:47.
 */
package com.sky

class BillController {

    ExternalBillCallService externalBillCallService

    def show() {
        Map billJson = externalBillCallService.requestBillJSON
        [model: billJson]
    }
}
