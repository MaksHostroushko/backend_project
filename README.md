# README

### How to install Rspec
1. Install Rspec. Add rspec-rails to the Gemfile in the test group and run bundle.
2. Generate Rspec boilerplate. Run rails generate rspec:install.
3. Configure generators to generate rspec tests. Add config.generators.test_framework = :rspec to config/application.rb.
4. Remove fixtures. In spec/rails_helper.rb remove the line starting with config.fixture_path = .
5. Remove minitest boilerplate. git rm -r test/.
6. rails generate rspec:model Post
