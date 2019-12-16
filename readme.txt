[comment]: <> (The below document is the GitHub ReadME File that is similarly applicable to the submission. The GitHub repo can be found at https://github.com/jeesonjohnson/RailsPodcastWebsite)



# Podly

Podly is a podcast, streaming and and social media platform, built on the rails framework. This project was created as part of coursework, for COM2025, at the university of Surrey, by Jeeson Johnson.

## Functionality
Some of the main features of the application are listed below, but have a play around with the application to get a better feel.
* Streaming of podcast's.
* Different User accounts, where in which each user can upload their own avatar's and other appropriate information.
* Ability for a given user to subscribe and unsubscribe from a given podcast.
* Ability for a given user to find other people that use the web application.
* Allow the user to search for any given podcast, and be presented with associated information.
* Discover the top trending podcasts and hot podcasts.
* Whilst all functioning from a singular web-page mimicking websites like Spotify.

However the above is not an exhaustive list, but a very brief view of the functionality associated with the application


## Version Data

The website was developed initially using  Rails (5.2.3) using Ruby (2.3.1), this is also the version that was submitted. However a slight alteration was made to the version on GitHub, to support Ruby (2.5.1), this was needed as the application is currently hosted on Heroku, however Heroku currently only allows applications to be hosted with Ruby versions > 2.4. The application also allows the storage of user avatar's through the use of Rail's Active Storage functionality.

The heroku hosted version can be found at **[HERE](https://podly-podcasts.herokuapp.com/)** (with url: [https://podly-podcasts.herokuapp.com/](https://podly-podcasts.herokuapp.com/))

## Installation and Setup

Before starting the program please run, the below command.
```bash
bundle install
```
As to see the full functionality of the application, a seed file has been used to setup the website database, where a login that is useful to identify more easily the functionality of the application is to use the account with details:

 **Email: admin@admin.com Password:adminadmin**

As mentioned above, the application currently has the ability to store a given user's avatar picture, which works perfectly when running on a local system. However if running the following command:
```bash
rails db:reset
```
and the the database reset's all associated user profile pictures will be reset, even with the seed function. However after the database reset it is possible to easily reuplod an avatar image by uploading the profile picture in the edit portion of a given user account.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
