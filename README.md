Foreword
========
This is a set of excercises used for internal trainings. You can do the excercises on your own. Each SOLID principle has it's own branch. 

Simply clone the project and checkout branch that coresponds to one of the principles. To find excersices just search for principle acronim inside the code base, ex. "[SRP]" to find Single Responsibility Principle excercises.

SOLID principles in Rails
==========================
## SRP - Single Responsibility Principle
### branch: 1_srp
A class should have one, and only one, reason to change

## OCP - Open/closed Principle
### branch: 2_ocp
You should be able to extend a class’s behavior, without modifying it.

## LSP - Liskov Substitution Principle
### branch: 3_lsp
Derived classes must be substitutable for their base classes. 

## ISP - Interface Segregation Principle
### branch: 4_isp
Make fine-grained interfaces that are client specific.

## DSP - Dependency Injection Principle
### branch: 5_dip
Depend on abstractions, not on concretions.

About the SolidClowns project
=============================
## How to start
Install dependencies
```
bundle install
```

Set up database
```
rake db:reset
```

Check if tests are working
```
rspec -fd
```

Run the server and check http://localhost:3000
```
rails s
```

## Features
* You can book a clown for you party 
* Clowns are getting points depending on their contract


Extras
======

## Meta programming
tbd.

## Law of Demeter
Each unit should only talk to its friends; don't talk to strangers.

## My solution can be found in the "refactor" branch
