package com.ashwin

class Organization {


    String orgName
    String orgEsta
    String orgLogo
    String orgDesc
    String orgLoc

    static belongsTo = [user:User]


    static constraints = {
    }

   }
