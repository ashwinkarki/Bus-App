package com.ashwin

import grails.gorm.DetachedCriteria
import org.codehaus.groovy.util.HashCodeHelper

class TrainUser {

    Training training
    User user
    Date date
    String cvName
    boolean status



    static constraints = {
    }
}
