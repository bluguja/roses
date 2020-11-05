
# ROSE APP
Welcome to the roses app. This app was created so as the use can interact seamlessly with the app.The app is supposes to be updated with types of roses
that the user has in mind. The method to do that is shown in the 'Usage' section of this README


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

    1. Navigate to the repo on GitHub at https://github.com/bluguja/roses/tree/master
    2. Fork and clone repo to your local machine.
    3. Click the green Clone or Download button and copy the remote https://github.com/bluguja/roses/tree/master
    4. Type git clone then paste the copied URL into your terminal.
    5. Type 'bundle install' to install dependencies. 

## Usage

    1. Run 'rake db:migrate' from your command line.
    2. Run 'shotgun' from your command line. Then you can go to your browser and view the application.
    3. Visit localhost:[port-number] (the port number will be specified after running shotgun).

From there, you can create your personal Roses  lists, add roses, edit roses and delete roses! 

https://github.com/ComputerScienceWarrior/lms
## Code of Conduct

Everyone interacting in the Rose app project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the :https://github.com/bluguja/roses/tree/master

