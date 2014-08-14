## Deployment:

Currently set up for deploying to a Dokku setup with Postgres (will probably work on Heroku too).

Run `rake db:migrate` from app environment, as usual.

Run `rake observation:start` to begin sampling vehicle locations.  Configure in `lib/tasks/observations.rake`.

Will start observations on deployment, given appropriate `Procfile` machinery on target (eg, [`dokku-shoreman`](https://github.com/statianzo/dokku-shoreman))
