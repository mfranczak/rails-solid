SOLID principles in Rails
==========================
## SRP - Single Responsibility Principle
A class should have one, and only one, reason to change

## OCP - Open/closed Principle
You should be able to extend a class’s behavior, without modifying it.

## LSP - Liskov Substitution Principle
Derived classes must be substitutable for their base classes. 

## ISP - Interface Segregation Principle
Make fine-grained interfaces that are client specific.

## DSP - Dependency Injection Principle
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
