# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * Ruby 2.6.5
  * Rails 5.2.4.1
* System dependencies

* Setup
  For local development hosting, a setup bash file has been provided.
  ```bash
  ./setup.bash
  ```


### User Roles
  This sites authentication system features multiple built in roles for users, to allow different functions. For development, we've included a seeded user for each role.

  Their email addresses are listed below.
  Meanwhile, the passwords are all the following: ``` 123456 ```

  * #### Admin
    * Has access to all functions on the site
    * ###### Email: ```admin@store.net```
  * #### Moderator
    * Has access to modify and delete comments to moderate their contents outside of our guidelines
    * ###### Email: ```moderator@store.net```
  * #### Vendor
    * Has access to add, modify, and delete product records pertaining to their vendor
    * ###### Email: ```vendor@store.net```
  * #### Curator
    * Has access to add, modify, and delete any product records
    * ###### Email: ```curator@store.net ```
