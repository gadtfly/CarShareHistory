## Deployment:

Currently set up for deploying to a Dokku setup with Postgres (will probably work on Heroku too).

Run `rake db:migrate` from app environment, as usual.

Run `rake locations:refresh` to populate initial car2go locations (cities), then `rake locations:observe` to record all current available vehicle locations.

Run `whenever -w` to schedule periodic car2go vehicle location observations (configure in `config/schedule.rb`).
