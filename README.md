## Deployment:

Currently set up for deploying to a Dokku setup with Postgres (will probably work on Heroku too).

Run `rake db:migrate` from app environment, as usual.

Run `rake observation:start` to begin sampling vehicle locations.  Configure in `lib/tasks/observations.rake`.
