class Post < ActiveRecord::Base
  
  #Associations goes here
  belongs_to :blog

 def self.update_post_table
    Post.transaction do
     blogs=Blog.all
     Post.delete_all
     urls1 = ["http://patshaughnessy.net/","http://patshaughnessy.net"]
     urls2= ["http://www.alexrothenberg.com/", "http://www.alexrothenberg.com"]
     blogs.each do |blog|
       if urls1.include?(blog.blog_url)
        blog.read_posts_one(blog)
       elsif urls2.include?(blog.blog_url)
         blog.read_posts_two(blog)
       else
         blog.read_posts(blog)
        end
     end
   end
   puts "Post Table updated successfully"
 end

end
