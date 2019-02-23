package com.ashwin

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

class TrainUserController {

    def springSecurityService
    def mailService

    @Secured('permitAll')
    def index() {
    redirect(action:"list")
    }

    @Secured('permitAll')
    def list(){
        def currentUser = springSecurityService.currentUser.id
        def user=User.findById(currentUser)
        def getOrganization=Organization.findByUser(user)
        println(getOrganization.orgName)

        def tuList = null
       def total= 0

            def trainingCategory=Training.findByOrganization(getOrganization)
            tuList=TrainUser.findAllByTraining(trainingCategory)
            total=tuList.size()
        def cvs=Cv.findByUser(user)

        render(view: "list",model: [trainuserLists: tuList,organ: getOrganization,count: total,cv:cvs])

    }

    @Secured('permitAll')
    def delete(){
        def id = params.id

        def originalTraining = TrainUser.get(id)
        originalTraining.delete(flush: true)

        redirect(action: "list")
    }

    @Secured('permitAll')
    def confirm(){
        println("------>"+params.id)
        def trainUser=TrainUser.get(params.id)
        trainUser.setStatus(true)
        trainUser.save(flush:true)

        def trainUserOne=TrainUser.findById(params.id)
        def trainingId=trainUserOne.training.id
        def training=Training.findById(trainingId)
        def orgId=training.organization.id
        println("------>trainingId"+trainingId)
        println("------>orgIId"+orgId)
        def org=Organization.findById(orgId)
        render(view: "confirm",model: [trainuser: trainUserOne,organiza:org,train:training])
    }

    @Secured('permitAll')
    def send(){
        mailService.sendMail {
            to params.email
            subject params.subject
            text params.body
        }

        redirect(action: "list")

    }


}
