This Phase involves building the centralised Pub Sub Model.

    DIRECTORY STRUCTURE

      1) Centralised => This is the centralised pub sub system powered by rails ( Which is executed in docker)
      2) subscriber1 and subscriber 2 => these two are subscribers [ backend]
      3) sub1.html and pub1.html are the frontend for the two subscribers
      4) publisher1.html is the frontend for publisher
      5) publisher1 is the backend for the publisher


   WORKFLOW

   1) Now cd to centralised
      run docker-compose build
       => it will create the image of the centralised pub sub system
   2) Now run docker-compose up
      => the centralised pub sub system should be up and running!!!!

   3) Now time to get the subscribers and publishers running
      The steps are going to be the same for all

   4) cd into subscriber1 
      make sure you have ruby and rails installed
      run bundle install
      => it will install all your dependencies 

      now run rails s -p 3005

      similary run 

      rails s -p 3004 for subscriber 2 and rails s -p 3003 for publisher after performing the above mentioned steps

   5) Now start pub1.html , sub2.html and publisher1.html in the browser and start enjoying the pub sub App!!!!