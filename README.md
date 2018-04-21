## Blocipedia

#### Blocipedia is a Bootstrap styled Ruby on Rails application built using TDD. The application provides a space for people to post, update, and delete wikis. Users (authenticated with Devise) also have the option to pay for the premium version of the site using Stripe. Premium users can post private wikis.

[Here is a link to the application](https://serene-dusk-49988.herokuapp.com/).

![landing page](https://i.imgur.com/2DzSDll.png)

### Technologies used

* Ruby on Rails
* Bootstrap
* Devise
* Stripe
* Rspec

### Explanation

Blocipedia is the second Ruby on Rails application that I built for Bloc. The application uses the Devise gem for user authentication, the Stripe gem for payment of premium plans, and Rspec for testing. I did have a little bit of guidance from my Bloc mentor at times, but this was the first Rails app that I built on my own. I was provided wireframes to use as a guide, and user stories to implement the features of the application. Bootstrap was used to provide simple styling and responsive layouts. 

### Problem

The first problem I had was learning how to use Devise for Authentication.

### Solution

While there is quite a bit of documentation available for Devise, I had no experience with it before starting the project, and it took some time to figure out how to get it working. It actually turned out to be more simple than expected, and I was able to get authentication in place without too  much trouble. The main thing that I had trouble with along the way was getting the development and production settings implemented correctly.

![sign up](https://i.imgur.com/FkClqxE.png)

![successful sign in](https://i.imgur.com/QvdT2sS.png)

![edit user](https://i.imgur.com/uwjEudq.png)

### Problem

The biggest problem I faced when making this application was figuring out how to create the collaborator model. For example, with the user, wiki, and collaborator models, which ones would belong to and which ones would have many of which?

### Solution

I finally arrived at the following:

 In the Collaborator class:

    belongs_to :user
    belongs_to :wiki

    
 In the user class: 
 
    has_many :wikis
    has_many :collaborators, dependent: :destroy

 In the wiki class: 
 
    belongs_to :user
    has_many :collaborators, dependent: :destroy
    has_many :users, through: :collaborators
    

### Results

Overall, I am happy with how the application turned out. There are still a few more features I would like to add, but I think the application is something that people would find value in.

### Conclusion

Building an entire Ruby on Rails application on my own was a lot of fun, and I learned a lot in the process. 

![new wiki](https://i.imgur.com/5K1ymEQ.png)

![wikis](https://i.imgur.com/9YxKvKd.png)

