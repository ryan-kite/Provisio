# Provisio
CSD 460 Capstone Project

### Pre-Requirements: 
  - Install Tomcat 9.* Server
  - must include these configs in <your-tomcat-folder>/conf/tomcat-user.xml
  ```
  <tomcat-users>
      <role rolename="manager-script"/>
      <user username="user" password="user" roles="manager-script"/>
  </tomcat-users> 

  <user username="admin" password="admin" roles="tomcat,admin,admin-gui,manager,manager-gui"/>
  ```
    
### Setup Project

#### How to Clone project to your machine 
from a command line run:
  git clone https://github.com/ryan-kite/Provisio.git

#### How to Convert project to a Dynamic Web Project (if you imported it as a folder)   
- Right click on the project properties
- Select “Project Facets“
- Check “Dynamic Web Module” & “Java“ > Apply & Close

#### Alternative way to import & clone Provisio into Eclipse: 
- File > Import > Git > Projects from Git (with smart import) > next
- Clone URI > next
- URI: https://github.com/ryan-kite/Provisio.git > next
- Check main > next
- Configure local storage: Directory: (your-directory) > next > finish 

#### Setting up Provisio to Run on TomCat Server in Eclipse:
- Provisio > run as > server 
- Launches project in browser (close it)
- Stop server
- Edit Servers > Tomcat >  server.xml 
  -- and change the path to "/"
  e.g.)
  Context docBase="provisio" path="/" reloadable="true ...
- Re-launch project: provisio > Run as > Run on Server

#### Making code changes:
create feature branch off of 'main'
#### ensure you are on main: 
- git status 
- git checkout main
- Create your feature branch
- git checkout -b rk/my-new-feature-work
#### Do some work, save, commit and push changes.
- git status  (to see changed files)
- git add .   (to stage all changed file for commit)
- git commit -m "A meaningful commit message about your work."
- git status  (make sure all is well in the world) 
- git push    (you push your changes to the repo)
- notifty Ryan your branch is ready to be merged

#### Run MySQL database setup scripts
- in the sql folder you will find files to build and populate your DB
- open your mysql terminal or GUI if using Workbench
- ensure you have already created user provisio user and password (see cheatsheet if needed.)
- build the database and tables with provisio_schema.sql
- populate the tables with provisio_populate.sql

