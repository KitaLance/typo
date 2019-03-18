Feature: Manage Categories
  As a blog administrator
  I want to be able to manage categories of my blog

   Background:
    Given the blog is set up
    And I am logged into the admin panel


   Scenario: Allow admin to save a new category
    And I am on the categories page
    When I fill in the following:
    | Name        | TestName                                    |
    | Keywords    | TestKeyworkd1, TestKeyworkd2, TestKeyworkd3 |
    | Description | This is a test description                  |
    And I press "Save"
    Then I should be on the categories page
    And I should see "This is a test description" 
    And I should see "TestKeyworkd1, TestKeyworkd2, TestKeyworkd3" 

   Scenario: Allow admin to edit an existing category
    Given that TestName categories are added
    And I am on the categories page
    When I follow "TestName"
    Then the "category_name" field should contain "TestName"
    When I fill in the following:
      | Keywords | TestKeyworkd4, TestKeyworkd5, TestKeyworkd6 |
    And I press "Save"
    Then I should be on the categories page
    And I should see "TestKeyworkd4, TestKeyworkd5, TestKeyworkd6"