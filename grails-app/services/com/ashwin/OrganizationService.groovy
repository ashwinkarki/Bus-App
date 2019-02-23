package com.ashwin


import grails.gorm.transactions.Transactional
import grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile


@Transactional
class OrganizationService {

    def serviceMethod() {

    }

    def uploadImage(MultipartFile file, String name, String destinationDirectory){

        def servletContext = ServletContextHolder.servletContext
        println "servletContext = $servletContext"
        def storagePath = servletContext.getRealPath( destinationDirectory )
        println "storagePath = $storagePath"
        def storagePathDirectory = new File( storagePath )

        if( !storagePathDirectory.exists() ){
            println("creating directory ${storagePath}")
            if(storagePathDirectory.mkdirs()){
                println "SUCCESS"
            }else{
                println "FAILED"
            }
        }

        if(!file.isEmpty()){
            file.transferTo( new File("${storagePath}/${name}") )
            println("Saved File: ${storagePath}/${name}")
            return true
        }else{
            println "File: ${file.inspect()} was empty"
            return false
        }
    }

    def uploadCV(MultipartFile file, String name, String destinationDirectory){
                def servletContext = ServletContextHolder.servletContext
        println "servletContext = $servletContext"
        def storagePath = servletContext.getRealPath( destinationDirectory )
        println "storagePath = $storagePath"
        def storagePathDirectory = new File( storagePath )

        if( !storagePathDirectory.exists() ){
            println("creating directory ${storagePath}")
            if(storagePathDirectory.mkdirs()){
                println "SUCCESS"
            }else{
                println "FAILED"
            }
        }

        if(!file.isEmpty()){
            file.transferTo( new File("${storagePath}/${name}") )
            println("Saved File: ${storagePath}/${name}")
            return true
        }else{
            println "File: ${file.inspect()} was empty"
            return false
        }
    }
}
