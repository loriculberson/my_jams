As an existing user
When I visit my profile
Then I should see my profile

As a non-exisiting user
When I visit a users profile
Then I should be redirected to the home page
And I should see a flash alert saying "Not authorized."

As an admin user
When I visit a users profile
Then I should see the profile information for that user