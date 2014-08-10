WFirma Ruby API
===========
*Warning*: This project implements only part of WFirma API due to current requirement of project that I am working on. All contributions are welcome :).

Implementation notes
===========
* Currently project is using simple plain authorization over HTTPS API

Available resources
===========
* goods

Example usage
===========
```ruby
require 'w_firma'
api = WFirma.new(login: 'login', password: 'password')

# Find goods
api.goods.find(limit: 10)
```

Contributions idea
===========
* WFirma.pl also support oAuth v1.1 authorization flow (contribution welcome), this would make us able to create 3rd part applications for WFirma.pl

Contributing to w_firma gem
===========
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
===========
Copyright (c) 2014 Ernest Bursa. See LICENSE.txt for
further details.

Note
===========
This project is maintained by 3rd part.