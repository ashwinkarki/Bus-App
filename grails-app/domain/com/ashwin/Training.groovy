package com.ashwin

class Training {

    String name
    String startDate
    String endDate

    int vacancy
    int views=0
    String cost

    static belongsTo = [organization:Organization]

    static constraints = {
    }


}
