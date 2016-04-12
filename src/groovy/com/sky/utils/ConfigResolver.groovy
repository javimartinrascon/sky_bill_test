/**
 * Created by javier-martin 
 * on 12/04/16 - 21:48.
 */
package com.sky.utils

import grails.util.Holders
import groovy.transform.CompileStatic

class ConfigResolver {

    @CompileStatic
    static ConfigObject getConfig() {
        Holders.config
    }
}
