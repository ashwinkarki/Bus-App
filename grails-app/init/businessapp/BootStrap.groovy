package businessapp

import com.ashwin.Role
import com.ashwin.User
import com.ashwin.UserRole

class BootStrap {

    def init = { servletContext ->
   /* def admin = new User(username: 'admin',password: 'admin')
        admin.save(flush:true)


        def user = new User(username:'user',password:'user')
        user.save(flush:true)

        def org = new User(username:'org',password:'org')
        org.save(flush:true)

        def orgRole=new Role(authority: 'ROLE_ORG')
        orgRole.save(flush:true)

        def adminRole = new Role(authority: 'ROLE_ADMIN')
        adminRole.save(flush: true)

        def userRole = new Role(authority: 'ROLE_USER')
        userRole.save(flush:true)


        UserRole.create(admin,adminRole,true)
        UserRole.create(user,userRole,true) */
    }
    def destroy = {
    }
}
