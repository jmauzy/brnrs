#SecLinks

Seclinks is a url shortener that creates self-destructing urls. Urls can be created to delete themselves after a given amount of time, a set number of redirects, or both. Inactive links are purged from the database.

This project contains three main parts:

- Ruby on Rails backend for link generation logic and database management
- React.js frontend interface for link creation in browser
- External API with token authentication (as part of the RoR stack) for third-party access to link creation
