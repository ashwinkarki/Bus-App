package businessapp

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

      // "/"(view:"/index")
        "/"(controller:"organization",action:"index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
