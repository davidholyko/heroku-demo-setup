[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# rails-api-campus-server

This is part of the Rails API sequence of talks. Each talk has its own
repository with a reference README.

- [Rails API: Single Resource](https://git.generalassemb.ly/ga-wdi-boston/rails-api-single-resource)
- [Rails API: One-to-Many](https://git.generalassemb.ly/ga-wdi-boston/rails-api-one-to-many)
- [Rails API: Many-to-Many](https://git.generalassemb.ly/ga-wdi-boston/rails-api-many-to-many)

Each talk is designed to walk through the creation of a real Rails API,
feature-by-feature, using "error driven development".

During the sequence, we will be building the following features for this API.

- [Library](docs/library.md)
- [Hospital](docs/hospital.md)
- [Cafeteria](docs/cafeteria.md)

The API contains a few important branches:

- `master` contains starter code.
- `tutorial` contains detailed commit history, and tags for where each talk
  should end.
- `solution` contains a feature-complete reference API. History is not
  canonical.

## Preparation

1. Fork and clone this repository.
1. Create a new branch, `training`, for your work.
1. Checkout to the `training` branch.
1. Install dependencies with `bundle install`.
1. Create a `.env` for sensitive settings (`touch .env`).
1. Generate new `development` and `test` secrets (`bundle exec rails secret`).
1. Store them in `.env` with keys `SECRET_KEY_BASE_<DEVELOPMENT|TEST>`
   respectively.
1. Setup your database with `bin/rails [db:drop] db:create db:migrate db:seed`.
1. Run the API server with `bin/rails server`.

## Tasks

Developers should run these often!

- `bin/rails routes` lists the endpoints available in your API.
- `bin/rails test` runs automated tests.
- `bin/rails console` opens a REPL that pre-loads the API.
- `bin/rails db` opens your database client and loads the correct database.
- `bin/rails server` starts the API.
- `scripts/*.sh` run various `curl` commands to test the API. See below.

## Additional Resources

- [Deploying a Rails API to Heroku](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide)
- [Rails guides for an API App](http://guides.rubyonrails.org/api_app.html)
- [Blog post of building a JSON API with Rails 5](https://blog.codeship.com/building-a-json-api-with-rails-5/)

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Rails Deployment with Heroku

You've learned a lot about how to build a Rails application over the last few
weeks. Now let's "go public" and share our apps with the world!

## Prerequisites

- [rails-api](https://git.generalassemb.ly/ga-wdi-boston/rails-api)
- This guide assumes you have followed [these installation instructions](https://git.generalassemb.ly/ga-wdi-boston/rails-api-template#installation)
  up to where the steps mention Heroku.

## Objectives

- Create a repository on GitHub for your project.
- Create a Heroku app from the command line.
- Push the latest code to Heroku.
- Migrate the production database.
- Grab the link to your deployed API and paste it into the `api_url.txt` file.
- Open a Pull Request to the GA repo so that we may check your API link.

## Getting Set Up

Before you can begin deploying your applications to Heroku, there are some
things you'll need to do first.

1. [Create a GitHub repository for your project](https://help.github.com/articles/create-a-repo/).
1. [Create a Heroku account](https://www.heroku.com).
    You will be sent an activation email, so be sure to check your inbox so that
    you can activate your account.
1. Install the Heroku Command Line Tools:
   - On macOS, run `brew install heroku/brew/heroku`.
   - On Ubuntu/WSL, run `curl https://cli-assets.heroku.com/install.sh | sh`.
1. **Login to Heroku** by running `heroku auth:login` from the console and providing
    your Heroku credentials when asked. Once you log in, if you're prompted
    to add these credentials to your keychain, say yes. *You will not be able*
    *to see your password*.

## Deploying to Heroku: Checklist

Now you're set up to use Heroku.

To deploy a new application to Heroku:

- [ ] [Create a New Heroku App](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide#create-a-new-heroku-app)
- [ ] [Push `master` to Heroku](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide#push-master-to-heroku)
- [ ] [Update Heroku's Database](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide#update-herokus-database)
- [ ] [Set Your Secrets](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide#set-your-secrets)
- [ ] [Check Your Work](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide#check-your-work)

Let's look at each of these steps in detail.

---

### Create a New Heroku App

Go to the root of your repo and run `heroku create`. This will create an
_autogenerated_ name for your app, and add a new remote repository to your repo
 called _heroku_. View your remotes by typing `git remote -v`. You should see
something like:

```sh
    heroku  git@heroku.com:agile-badlands-7658.git (fetch)
    heroku  git@heroku.com:agile-badlands-7658.git (push)
    origin  git@github.com:tdyer/wdi_4_rails_hw_tdd_hacker_news.git (fetch)
    origin  git@github.com:tdyer/wdi_4_rails_hw_tdd_hacker_news.git (push)
```

---

### Push `master` to Heroku

Only keep clean, working code on `master`. After you complete a feature, merge
it onto `master`. Push your updated `master` to GitHub, then to Heroku.

```sh
git checkout master
git merge my-feature # merge your working code
git push origin master # update GitHub
git push heroku master # update Heroku
```

---

### Update Heroku's Database

Once you've deployed your code, you can safely run new migrations. You'll need
to do this step every time you have new migrations.

```sh
heroku run rails db:migrate
```

If you have seeds or examples, or if you've updated seeds or examples, you
should also run them on Heroku.

```sh
heroku run rails db:seed
heroku run rails db:examples
```

---

### Set Your Secrets

bundle exec rails secret

Set your environmental variables in your Heroku app.

```sh
heroku config:set SECRET_KEY_BASE=$(rails secret)
```

```sh
heroku config:set SECRET_TOKEN=$(rails secret)
```

```sh
heroku config:set CLIENT_ORIGIN=https://yourgithubname.github.io
```

_**IMPORTANT NOTE:** The URL in the above command must NOT have a trailing slash
on the end. If you're experiencing CORS issues, ensure that your `CLIENT_ORIGIN`
variable has no slash on the end._

---

### Check Your Work

Restart your application and check it out in the browser.

```sh
heroku restart
heroku open
```

You'll probably see something like this:

![](https://cloud.githubusercontent.com/assets/388761/13259005/93c9fdf6-da23-11e5-9c90-19c59580944a.png)

That's normal, **unless** you have defined a root route.

---

### Change Your App's Name (optional)

If you wish you can rename your app at any time. It must be unique across all
apps deployed to Heroku.

```sh
heroku apps:rename newname
```

Your app will become immediately available at it's new subdomain,
`newname.herokuapp.com`.

---

### Share Your App **(REQUIRED)**

1. [Open a Pull Request on this repository](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide/compare).
1. Include the deployed URL of your Heroku app in the Pull Request.

## Heroku Command Reference

A full list of Heroku commands can be accessed by running `heroku --help`; below
are some of the more common ones.

|                Commands                |                                                 Behavior                                                 |
| -------------------------------------- | -------------------------------------------------------------------------------------------------------- |
|             `heroku logs [--tail]`              |                                   Running just `heroku logs` will show you the server logs from your deployed API. The `--tail` flag is optional.                        |
|            `heroku run ...`            |                                    Run a program from within Heroku. Examples (`heroku run rails console`, `heroku run rails db:migrate`).                                     |
|            `heroku config`             |                           Environmental variables in your current Heroku app.                            |
|            `heroku config:set SECRET_KEY_BASE=$(rails secret)`            |                                    Set Secret Key.                                     |
|            `heroku config:set SECRET_TOKEN=$(rails secret)`            |                                    Set TOKEN.                                     |
|            `heroku config:set CLIENT_ORIGIN=https://yourgithubname.github.io`            |                                    Set CLIENT_ORIGIN.                                     |
|            `heroku apps:rename newname`            |                                    Rename Heroku app name (entirely optional).                                     |
|            `heroku restart`            |                                    Restart the Heroku app, make sure you do this after changing your API.                                     |
|            `heroku open`            |                                    Open your Heroku app in default browser.                                     |
|            `heroku --help`            |                                    Displays a Heroku CLI usage summary.                                     |

## WARNING: Ephemeral Filesystem

One serious limitation of Heroku is that it provides an "ephemeral filesystem";
in other words, if you try to save a new file inside the repo (e.g. an uploaded
image file), it will disappear when your app is restarted or redeployed.

As an example, try running the following commands:

```sh
heroku run bash
touch happy.txt; echo 'is happy' > happy.txt
cat happy.txt
```

Then, hit Ctrl-D to get out of Heroku bash shell. If you re-open the shell and
run `ls -l`, `happy.txt` will be missing!

The typical workaround is to save files in cloud storage such as [Amazon
S3](https://aws.amazon.com/s3/); more on this in the near future.

![](https://www.thehinzadventures.com/wp-content/uploads/2015/03/54843046.jpg)

## Troubleshooting

These are the commands required for deploying to Heroku with rails. If your
Heroku deployment isn't working as expected, review these steps carefully.

- `heroku create`
- `git push heroku master`
- `heroku run rails db:migrate`
- `heroku run rails db:seed`
- `heroku config:set SECRET_KEY_BASE=$(rails secret)`
- `heroku config:set SECRET_TOKEN=$(rails secret)`
- `heroku config:set CLIENT_ORIGIN=https://yourgithubname.github.io`
- `heroku apps:rename newname` (optional)
- `heroku restart`
- `heroku open`

If you have successfully deployed your Rails API but are experiencing problems
with the production database (note that the production database is _entirely_
separate from your development database), you may find it useful to use the
command `heroku pg:psql` to connect to the production database with the PSQL
client. Be cautious though, it's possible to accidentally destroy production
data from the CLI.

## Additional Resources

- [Heroku Command Line](https://devcenter.heroku.com/categories/command-line)
- [Heroku Rails Deployment](https://devcenter.heroku.com/articles/getting-started-with-rails5)

## [License](LICENSE)

1. All content is licensed under a CC­BY­NC­SA 4.0 license.
1. All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.


## [License](LICENSE)

1. All content is licensed under a CC­BY­NC­SA 4.0 license.
1. All software code is licensed under GNU GPLv3. For commercial use or
   alternative licensing, please contact legal@ga.co.
