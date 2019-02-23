package com.ashwin

import grails.plugin.springsecurity.annotation.Secured

class TrainingController {
    def springSecurityService

    @Secured('permitAll')
    def index() {
        redirect(action:"create")
    }

    @Secured('permitAll')
    def create(){
        def currentUser = springSecurityService.currentUser.id
        def user=User.findById(currentUser)
        def getOrganization=Organization.findByUser(user)
        render(view: "create",model: [organ: getOrganization])
    }
    @Secured('permitAll')
    def save(){
        def name = params.name
        def startDate = params.startDate
        def endDate = params.endDate
        def cost = params.cost
        def vacancy=params.vacancy
        println("vacany is"+vacancy)
        def organName = params.selectOrganization
        println organName
        def orgName = Organization.findByOrgName(organName)
        println orgName.id
        def q=new Training(name:name,startDate:startDate,endDate:endDate,cost:cost,organization: orgName,views: 0,vacancy: vacancy)

        q.save(failOnError: true)

        redirect(action: "list")

    }
    @Secured('permitAll')
    def list(){

        def max = params.max? params.int('max'):10
        params.max = Math.min(max,100)
        def tList = null
        def total= 0
        if(params.query) {
            tList = Training.createCriteria().list(params) {
                ilike("name", "${params.query}%")
            }
            total = tList.size()
        }
        else if(params.id){
            def orgId=params.id
            def orgCategory = Organization.get(orgId)
            tList=Training.findAllByOrganization(orgCategory)
            total=tList.size()
        }else{
            tList = Training.list(params)
            total = Training.list().size()
        }
        redirect(controller: "trainUser",action: "list")
        // render(view: "list",model: [trainingList: tList,count:total])

    }
    @Secured('permitAll')
    def edit(){
        def id = params.id
        def specificTraining = Training.get(id)

        render(view: "edit",model:[editTraining:specificTraining])
    }
    @Secured('permitAll')
    def update(){
        def id=params.id
        def originalTraining = Training.get(id)

        originalTraining.name = params.name
        originalTraining.startDate = params.startDate
        originalTraining.endDate = params.endDate
        originalTraining.cost = params.cost

        originalTraining.save(flush: true)

        redirect(action: 'list')
    }

    @Secured('permitAll')
    def delete(){
        def id = params.id

        def originalTraining = Training.get(id)
        originalTraining.delete(flush: true)

        redirect(action: "list")
    }

    @Secured('permitAll')
    def history(){
        def id = params.id
        println("new id id"+id)
        def org=Organization.findById(id)
        def trainings = Training.findByOrganization(org);


        render(view: "history",model: [training: trainings])
    }

    @Secured('permitAll')
    def editorgtrain(){
        def id = params.id
        def defTrain = Training.get(id)

        render(view:"editorgtraining",model:[training:defTrain])
    }

    @Secured('permitAll')
    def updateorgTrain(){
        def id=params.id
        def editTraining = Training.get(id)

        editTraining.name = params.name
        editTraining.startDate = params.startDate
        editTraining.endDate = params.endDate
        editTraining.cost = params.cost

        editTraining.save(flush: true)

        redirect(controller: "trainUser",action: "list")
    }

    @Secured('permitAll')
    def delorgtrain(){
        def id=params.id
        def training=Training.get(id)
        originalOrg.delete(flush: true)
        redirect(controller: "trainUser",action: "list")
    }

}
