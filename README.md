# Provisio
CSD 460 Capstone Project

## Pre-Requirements: 
Install Server: Tomcat 9.*
  - w/ these user permissions ... include

Setup guide:
TODO:

Clone project 
TODO: git clone {this project git}

Import into eclipse: 
TODO: how to import git project in to eclipse as dynamic web application

Run setup scripts
TODO: sql populate scripts

Setting up Project to Run on TomCat in Eclipse:
provisio > run as > server 
launches browser  (close it)
Stop server
now go to Server > server.xml 
and change the path to "/"
e.g.
Context docBase="provisio" path="/" reloadable="true ...
Launch project should be working now.

Making code changes:
create feature branch off of 'main'
  - work on that 
  - push feature branch to the repo 
  - raise a pull request
