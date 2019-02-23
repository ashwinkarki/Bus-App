package com.ashwin

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.CREATED

class OrganizationController {

    SpringSecurityService springSecurityService
    def organizationService
    def userService


    @Secured('permitAll')
    def index() {
        def max = params.max? params.int('max'):10
        params.max = Math.min(max,100)


        def total= 0
         if(SpringSecurityUtils.ifAllGranted('ROLE_ORG')){
             total=Training.list().size()
           redirect(controller: "trainUser",action: "list")
           return
       }
         else if(SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
             println("i m hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")

             def currentUser = springSecurityService.currentUser.id
             println(currentUser)
           //  def user=User.findById(currentUser)
             if(params.query==null){
                 def trainingList=Training.executeQuery("FROM Training tr where tr.id NOT IN (SELECT t.training.id from User u INNER JOIN TrainUser t on u.id=t.user.id where u.id=t.user.id AND u.id=:uid)",[uid:currentUser])
                 total=Training.list().size()
                 render(view:"index",model:[trainingLists:trainingList,count:total])
             }
             else{
                 def trainingList = Training.createCriteria().list(params) {
                     ilike("name", "${params.query}%")
                 }
                 if(trainingList.equals(null)){
                     println("i m here")
                     def organization = Organization.createCriteria().list(params) {
                         ilike("orgName", "${params.query}%")

                         trainingList=Training.findByOrganization(organization)
                 }
                 }
                 [trainingLists:trainingList]
                 total=Training.list().size()
                 render(view:"index",model:[trainingLists:trainingList,count:total])
             }


        return
         }
         else{
             if(params.query) {
                 def trainingList = Training.createCriteria().list(params) {
                     ilike("name", "${params.query}%")
                     total=Training.list().size()
                 }
                 [trainingLists:trainingList]
                 render(view:"index",model:[trainingLists:trainingList,count:total])
             }
              }


        def trainingList = Training.list()
        total=Training.list().size()
       [trainingLists:trainingList,count:total]
        //redirect(action:"create")
    }
    @Secured('permitAll')
    def create(){

    }
    @Secured('permitAll')
    def save(){
        def maxNextId = User.executeQuery("select max(id) from User")[0]
       def user = userService.get(maxNextId)
        def getFile = params.getFile
        println(params)
//        println "-------------------"+getFile.getOriginalFilename()
        def okContentTypes = ['image/jpeg','image/png','image/jpg']//application/pdf

        if(!okContentTypes.contains(getFile.getContentType())){
            render "invalid image"
        }else {
            def fileUploaded = organizationService.uploadImage(getFile, getFile.getOriginalFilename(),
                    "assets/images")
            println "fileUploaded = $fileUploaded"
            if (fileUploaded) {
                println "here"
                def org =new Organization(orgName:params.orgName,orgEsta:params.orgEsta,orgLogo: getFile.getOriginalFilename(),orgDesc:params.orgDesc,orgLoc:params.orgLoc,user:user)
                org.save(flush: true)

                redirect(action: "index")
            }
        }

    }

    @Secured('permitAll')
    def list(){

        def orgList = Organization.list()
        //def currentUser = springSecurityService.currentUser
       // println("Current User-------------------> "+currentUser)
       // def role = springSecurityService.authentication.getAuthorities()
       // println("ROLE---------------------> " +role)

        [orgLists:orgList]
    }

    @Secured('permitAll')
    def edit(){
        def id = params.id
        def originalOrg = Organization.get(id)

        render(view:"edit",model:[editOrg:originalOrg])

    }

    @Secured('permitAll')
    def update(){
        def id = params.id
        def originalOrg = Organization.get(id)
        originalOrg.orgName=params.orgName
        originalOrg.orgEsta=params.orgEsta
        originalOrg.orgLogo=params.orgLogo
        originalOrg.orgDesc=params.orgDesc
        originalOrg.orgLoc=params.orgLoc


        originalOrg.save(flush: true)

        redirect(action:"list")
    }

    @Secured('permitAll')
    def delete(){
        def id = params.id
        def originalOrg = Organization.get(id)
        originalOrg.delete(flush: true)
        redirect(action: "index")
    }

    @Secured('permitAll')
    def detail(){

    }

    @Secured('permitAll')
    def notconfirmed(){
        def trainingList = Training.list()
        [trainingLists:trainingList]
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def confirmed(){
        def views=1;
        def trainingView=Training.findById(params.id);
        views=trainingView.views+1
        trainingView.setViews(views)
        trainingView.save(flush: true)

        def id = params.id
        println "Training Id: "+id
        def user = springSecurityService.currentUser
       // def user = springSecurityService.get(SpringSecurityService.principal.id)
       // def userID=springSecurityService.currentUser.id
        def trainingMain = Training.get(id)
        println "Training Org ID: "+trainingMain.id
        def orgTraining=Organization.get(trainingMain.organizationId)

        def cv=Cv.findByUser(user)
        def cvNames=cv.cvName;
        println("CV name"+cvNames)

   new TrainUser(date:new Date(),user:user,training:trainingMain,cvName:cvNames,status:false).save(flush: true, failOnError: true)
        def maxNextId = TrainUser.executeQuery("select max(id) from TrainUser")[0]
        def trainUser=TrainUser.get(maxNextId)
        println "TrainUser"+trainUser.id
        println "Max id: "+maxNextId
        render(view:"success",model:[trainApp:trainingMain,maxTrain:trainUser])
    }

    @Secured('permitAll')
    def cancel(){
        def id = params.id
        def trainUser=TrainUser.get(id)
        trainUser.delete(flush: true)
        redirect(action: "index")
    }

    @Secured('permitAll')
    def createorg() {
        respond new User(params)
    }

    @Secured('permitAll')
    def saveorg(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            def user1=new User(username:params.username,password: params.password)
            userService.save(user1)
            println("i m here in orgcontroller")
            new UserRole(user:user1,role:Role.findByAuthority('ROLE_ORG')).save(flush: true, failOnError: true)
            redirect(action: "create")
        } catch (ValidationException e) {
            println(e.getMessage())
            respond user.errors, view:'create'
            return
        }


    }

    @Secured('permitAll')
    def anotherpage() {

    }

    @Secured('permitAll')
    def contactus() {

    }

    @Secured('permitAll')
    def aboutus() {

    }





}
