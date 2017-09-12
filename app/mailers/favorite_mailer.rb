class FavoriteMailer < ApplicationMailer
    default from: "ijsimon@sbcglobal.net"
    
    def new_comment(user, post, comment)
 
 # #18
     headers["Message-ID"] = "<comments/#{comment.id}@http://bloccit5-isimon1002.c9users.io:8080/>"
     headers["In-Reply-To"] = "<post/#{post.id}@http://bloccit5-isimon1002.c9users.io:8080/>"
     headers["References"] = "<post/#{post.id}@http://bloccit5-isimon1002.c9users.io:8080/>"
 
     @user = user
     @post = post
     @comment = comment
 
 # #19
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
   
   def new_post(post, user)
     headers["Message-ID"] = "<post/#{post.id}@http://bloccit5-isimon1002.c9users.io:8080/>"
     headers["In-Reply-To"] = "<post/#{post.id}@http://bloccit5-isimon1002.c9users.io:8080/>"
     headers["References"] = "<post/#{post.id}@http://bloccit5-isimon1002.c9users.io:8080/>"
 
     @user = user
     @post = post
       
     mail(to: user.email, subject: "You have favorited and will recieve notifications from #{post.title}")
 end
end
