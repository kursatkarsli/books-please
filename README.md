# Books Please!

Books Please! is a website for managing books among a group of friends.
One can add a book to a system by providing its title.
The details of the book will be automatically imported from [Goodreads](https://www.goodreads.com").
A user can add a book to his favourite list or change its status (to read, currently reading, completed, rejected).

**Warning:** The project is not completed yet.
The progress of the development process is about 50%.
Additional features will be implemented in the next few days.

## Technologies and tools

* Development machine: Ubuntu 16.04 LTS
* Editor: Visual Studio Code
* Haml, Bootstrap, jQuery
* Devise, FriendlyId
* Guard + LiveReload (before: BrowserSync)
* Git + Git-Flow

## Deployment

* Production (master branch): https://books-please.herokuapp.com
* Staging (develop branch): https://books-please-staging.herokuapp.com
* Review apps (each pull request): https://books-please-staging-pr-X.herokuapp.com

`db:seed` creates some sample user accounts.

## To be implemented

* Rating books
* Sorting books by title, rating, created date
* Book list view and pagination
* Drag&drop-ordered book shelves
* Owning books
* Editing books
* Manually adding books and uploading covers
* ActionMailer: sending weekly a newsletter about recent changes in the bookcase
* Dashboard for users
* Mobile-friendly views

## Backlog management
https://www.pivotaltracker.com/n/projects/2109052