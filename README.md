# Sequra Technical Challenge
[Instructions](https://gist.github.com/francesc/33239117e4986459a9ff9f6ea64b4e80 "Instructions")

## Setup
`Ruby: 2.7.3`
`Rails 6.1.6` 


```shell
bundle install
bundle exec rails db:setup
rails s
```
### API 
* Parameters are `merchant_id` && `date`
* Sample End point for a merchant  e.g. `GET /disbursements?merchant_id=1&date=2018-01-23 20:10:00`
* Sample End point for all merchants if no merchant if given e.g.  `GET /disbursements?date=2018-01-23 20:10:00`

## Test
Run tests with ` bundle exec rspec` 

## Running Background job
Run with `bundle exec sidekiq`

## Technical Notes
* Ruby on Rails was used to build the app
* Sidekig was used to handle background jobs
* Sidekiq-scheduler was used to schedule jobs
* Rspec was used for testing
* Postgresql was used as database

## Improvements
* Api Versioning
* Add Indexes for search optimization
* Security
* Write more tests 
* Caching

