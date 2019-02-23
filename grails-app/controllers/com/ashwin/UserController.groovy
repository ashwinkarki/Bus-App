package com.ashwin

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured('permitAll')
class UserController {

    def springSecurityService
    def organizationService
    def userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }

    def show(Long id) {
        respond userService.get(id)
    }

    @Secured('permitAll')
    def create() {
        respond new User(params)
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
            userService.save(user)

            new UserRole(user:user,role:Role.findByAuthority('ROLE_ORG')).save(flush: true, failOnError: true)

        } catch (ValidationException e) {
            println(e.getMessage())
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }


    @Secured('permitAll')
    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            def user1=new User(username:params.username,password: params.password)
            userService.save(user1)
            println("i m here in usercontroller")
            new UserRole(user:user1,role:Role.findByAuthority('ROLE_USER')).save(flush: true, failOnError: true)
            redirect(controller: "organization",action: "index")
        } catch (ValidationException e) {
            println(e.getMessage())
            respond user.errors, view:'create'
            return
        }

    }


    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured('permitAll')
    def userprofile(){
        def currentUser = springSecurityService.currentUser.id
        def user=User.findById(currentUser)
       // println("user id is"+user.id)
        def trainUser=TrainUser.findAllByUser(user)
       // println("---------------->"+trainUser.training.startDate)
        render(view:"userprofile",model:[trainUsers:trainUser])
    }

    @Secured('permitAll')
    def uploadcv(){
        def currentUser = springSecurityService.currentUser.id
        def user=User.findById(currentUser)
        def cvs=Cv.findByUser(user);
       // println("cvname"+cvs.getCvName())

        if (cvs.equals(null)){
            render(view:"uploadcv")
        }
        else{
            render(view:"uploadcv",model:[cv:cvs])
        }

    }

    @Secured('permitAll')
    def savecv(){
        def currentUser = springSecurityService.currentUser.id
        def user=User.findById(currentUser)
        def getFile = params.getFile
        println(params)
//        println "-------------------"+getFile.getOriginalFilename()
        def okContentTypes = ['application/pdf']

        if(!okContentTypes.contains(getFile.getContentType())){
            render "invalid image"
        }else{
            def fileUploaded= organizationService.uploadCV( getFile, getFile.getOriginalFilename(),
                    "assets/cv" )
            println "fileUploaded = $fileUploaded"
            if( fileUploaded){
                def cv=new Cv(cvName:getFile.getOriginalFilename(),user:user)
                println "Uploaded CV"
                cv.save(flush:true)
                redirect(controller: "organization",action: "index")


            }
        }

    }



    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
