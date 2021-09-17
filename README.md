# README

A project for TheOdinProject
(https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/members-only)


The goal of the project was to create a web app where users can create posts, and can be viewed by anyone. However, only users that are signed in (members of the site) will be able to see who created the post.

I decided to take things a step further by adding in a comment and reply system. All posts can be commented on, and comments can be commented on, with only members being able to see who wrote the comment. 

This project taught me a lot about the associations between different models, and how the ActiveRecord makes everything easier. I also learned how to use the Devise Gem, which makes user authentication and sessions a piece of cake. I had implemented my own version of user authentication previously with bcrypt, and I can really understand why Devise is so useful.

I also went ahead and styled the site entirely with bootstrap. This was my first major use of bootstrap, and while I was hesitant about the framework overall, I can now say that I love it and plan to use it a lot in the future. The entire site works in a responsive manner on all devise sizes, made extremely easy with bootstrap.

As the project progressed, I kept thinking of better ways to improve user experience, such as having a modal window pop up for creating a post as opposed to a separate page. This introduced me to jQuery and Ajax which I picked up very easily.

Possible features I am looking to implement in the future are likes, and removing a post after 24 hours.