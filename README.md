
# ROSE APP
Welcome to the roses app. This app was created so as the use can interact seamlessly with the app.the app...


## Restful Routes and CRUD Actions

REST => Representation State Transfer => set of conventions for structuring our ROUTES and mapping them to CRUD actions (Create, Read, Update, Delete).

  | HTTP VERB | ROUTE | ACTION   | CRUD Function |
| ------------- |-------------| ----------- | ------------------- |
| GET |  /roses  | index | Read |
| GET | /roses/:id | show | Read |
| GET | /roses/new | new | Create |
| POST | /roses | create | Create |
| GET | /roses/:id/edit | edit | Update |
| PATCH (PUT)* | /roses/:id | update | Update |
| DELETE | /roses/:id | delete | Delete |

*(patch modifies, put replaces)


## Installation

    1. Navigate to the repo on GitHub at MY GITHUB URL
    2. Fork and clone repo to your local machine.
    3. Click the green Clone or Download button and copy the remote URL.
    4. Type git clone then paste the copied URL into your terminal.
    5. Type 'bundle install' to install dependencies. 

## Usage

    1. Run 'rake db:migrate' from your command line.
    2. Run 'shotgun' from your command line. Then you can go to your browser and view the application.
    3. Visit localhost:[port-number] (the port number will be specified after running shotgun).

From there, you can create your personal BookGenie reading lists, add roses, edit roses and delete roses! Make sure to listen to our bomb reading playlist to jam along to while you get your inner reading book worm on!

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
MIT © https://github.com/sandienunez 
s
## Code of Conduct

Everyone interacting in the Rose app project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the : MY GITHUB URL

