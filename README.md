# FreeTree
## An optionally anonymous microblogging application

## User stories

* I want to create an account
    * 
        * users#new
        * users#create
    * I want my account to register one or more ##alias
        * users/alias#new
        * users/alias#create
    * I want to see my ##aliases
        * users/alias#index
* I want to destroy my account
    * 
        * users#destroy
* I want to log in and out of my account
    * 
        * sessions#new
        * sessions#create
        * sessions#destroy
* I want to upload a micropost
    * I want to make a micropost anonymously by default or post under an alias with user##alias
        * microposts#new
        * microposts#create
        * microposts/:id#show
*	I want to see my microposts
    * 
        * microposts#index
* I want to comment on one or many  microposts
    * each micropost has a post number visible to all users
    * typing @#post_number into a post will create your post as a comment to another
        * micropost/:id#comment
*	I want to flag a post for later
    *	I want to see my flags
        * flags/:micropost_id#update
        * flags#index
* I want to call out a user in a micropost by his username
    * typing @username in a micropost will accomplish this
        * messages/:user_id#create
    * I want to see messages that were called out to me
        * messages#index
    * I want new messages to me to be marked with an unread flag.
    * I want to flag old messages as unread.
* I want to append a #hashtag to my own or one or many of my parent microposts
    * typing #anytag in a tag will add the hashtag to your post
    * typing #anytag into a micropost with no content but a comment marker will add the #hashtag to the parent post
* I want to see the #hashtags appended to posts and how many of each
    * microposts/:id/hashtags/#index
* I want to search for posts
    * I want to search by #hashtag
    * I want to search by @username
        * search
* I want to subscribe to @usernames and #hashtags
    * I want a feed loads posts by my subscripions
        * subscription#create
        * subscription#delete
        * feed
