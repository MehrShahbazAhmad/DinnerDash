# DinnerDash
- Rails Test Project
---
_**DinnerDash**_ is a an online commerce platform for a restaurant to facilitate online ordering.
### Users
A Guest can
* View all the Items
* Add Items to the Cart
* Remove or Change Quantatity of the Item in the Cart
* Sign Up or Log in

A User can
* View all the Items
* Add Items to the Cart
* Remove or Change Quantatity of the Item in the Cart
* Checkout the Cart for the Order

A Admin can
* Create Restaurants, Categories and Items
* Add Items to a existing Category
* Change the Status of the Order
* Delete Restaurants, Categories and Items
* Change the Status of the Items


## Technology Stack
---
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white) ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![Bootsrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
## Environment Setup
---
| Tools/Technologies      | Description |
| :---        |:----   |
| Ruby   | Version 2.7.2        |
| Rails   | Version 5.2.7        |
| Postgres   | Version 14.2        |
## Local Machine Setup
---
Open Termnal and type
``` sh
git clone https://github.com/MehrShahbazAhmad/DinnerDash.git
```
Then
```sh
cd dinnerdash
```
Install Gems
``` sh
bundle
```
Run DB Build
```
rails db:create
```
Run Server
```
rails s
```
