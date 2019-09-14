# Poll On Rails - Simple Voting System
## Pre Requirements: Ruby 2.6.3, Ruby on Rails 6.0.0, PostgreSQL 11.4

### Installation & Configuration

* Delete ```config/credentials.yml.enc```

* Generate new credentials:
```EDITOR="nano" bin/rails credentials:edit```

* Add to ```config/credentials.yml.enc``` the credentials needed in ```config/database.yml``` and ```app/helpers/application_helper.rb```

* ```bundle install```

* ```rake db:setup```

* ```rails server```
