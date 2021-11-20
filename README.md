# CLIn Boards

THis is a group Poject develop with Ruby, it works like a Kanban board.

You can create, show, update and delete a board with the first menu.

A board containd different lists(could be todo, progressive, etc), each list containd different cards(represent tasks).

At the same way like board, you have a menu for list and card(create, show, update and delete).


```ruby
####################################
#      Welcome to CLIn Boards      #
####################################
+-------------------------------------------------------------------------------------------------------+
|                                              CLIn Boards                                              |
+----+---------------------------------+-------------+--------------------------------------------------+
| ID | Name                            | Description | List(#cards)                                     |
+----+---------------------------------+-------------+--------------------------------------------------+
| 1  | Extended - CLIn Boards(devedux) | Holi        | Todo(3), In Progress(2), Code Review(1), Done(2) |
| 2  | Pokemoncito                     |             | Todo(2), In Progress(2)                          |
+----+---------------------------------+-------------+--------------------------------------------------+
Board options: create | show ID | update ID | delete ID
exit
>
```


## Before starting!

1. Install ruby
2. Install ruby-bundler
3. Run bundle install on terminal to intall gems
```ruby
$ bundle install
```


## To Start

1. Run
```ruby
$ ruby main.rb
```
## If you can use Docker

### On Linux/MacOS

1. From the VS Code terminal run the next docker command

```powershell
docker container run \
--name ruby \
-it \
-v $(pwd):/app \
-v ssh:/root/.ssh \
-v bundle:/usr/local/bundle \
-e GIT_USER_NAME=<your_username> \
-e GIT_USER_EMAIL=<your_email> \
--rm \
codeableorg/ruby
```

## If on Windows

2. From the VS Code terminal, select Powershell terminal, then run the next docker command

```powershell
docker container run \
--name ruby \
-it \
-v ${PWD}:/app \
-v ssh:/root/.ssh \
-v bundle:/usr/local/bundle \
-e GIT_USER_NAME=<your_username> \
-e GIT_USER_EMAIL=<your_email> \
--rm \
codeableorg/ruby
```

## Then

3. Clone the repository

```powershell
$ git clone ...
```

4.  Run some initialization scripts

```powershell
$ bootstrap
```

5.  Install some necessary gems for rubocop to work properly

```powershell
$ bundle install
```

6. Run
```powershell
$ ruby main.rb
```

Ready, you can enjoy!

<br/><br/>

*Made by Monito Inc. 🙊*

*Made by Devedux*

*Made by ChirstianMRtz*

*Made by Dortizp*

