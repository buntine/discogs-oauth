# discogs-oauth

An example app for authenticating with OAuth using my [Discogs library](https://github.com/buntine/discogs).

## Getting Started

Bundle, run the database migrations, start the server and browse to [http://127.0.0.1/tests](http://127.0.0.1/tests).

```
$ git clone https://github.com/buntine/discogs-oauth.git
$ cd ./discogs-oauth
$ bundle install
$ rake db:migrate
$ rails server
```

## Authentication

Many of Discog's API endpoints require authentication through OAuth. In order to authenticate, first log into your Discogs account and [create an application](http://www.discogs.com/settings/developers) to generate a Consumer Key and a Consumer Secret as described in the [API documentation](http://www.discogs.com/developers/oauth.html).

To prevent your keys from being tracked by Git and potentially exposed, create a `environment_variables.yml` file inside the `/config` directory. This file has been added to the example app's `.gitignore` file and its contents [will be accessible](https://github.com/buntine/discogs-oauth/blob/master/app/controllers/tests_controller.rb#L11-L12) by the tests controller when you start the server.

```
# /config/environment_variables.yml

development:
    DISCOGS_API_KEY:
    DISCOGS_API_SECRET:
```

## License

See the [LICENSE](https://github.com/mmwtsn/discogs-oauth/blob/master/LICENSE) file.
