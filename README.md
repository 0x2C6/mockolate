
# mockolate

  

 ## Description

Mockolate is easy to us endpoint (service) faker with mock responses. It can also be  used as DSL for hash
  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mockolate'
```

And then execute:

```
$ bundle
```

Or install it yourself as:
  
```
$ gem install mockolate
```

## Usage
  
Create hash object using Request class and its dsl

```ruby
class UserRequestParams < Mockolate::Request
  payload export_with: :firstname do
    string    :firstname,    fake_from: 'Name', key: 'first_name'
    string    :lastname,     fake_from: 'Name', key: 'last_name'
    integer   :age,          value: 21
    array     :books do 
      hash do
        string    :name,      value: 'Tehlikeli Oyunlar'
        string    :author,    value: 'Oguz Atay'
        integer   :published, value: 1973
      end
      hash do
        string    :name,      value: '1984'
        string    :author,    value: 'George Orwell'
        integer   :published, value: 1949
      end
    end
  end
end

```

You can even generate dynamic data by using `fake_from` and `key` options which using Faker gem under the hood
If you planning to access the hash with key pass `export_with` option to payload
For results use `generate_array!` or `generate_hash!` (which returns nested hash with export key) instance methods.

`UserRequestParams.new.generate_hash!`

Consume data from remote endpoint created data by `Mockolate::Request`

```ruby
class UserService < Mockolate::Response
  object_from UserRequestParams
  
  define_endpoint! :profile_by_email do |email|
    object[email]
  end
end

UserService.new.profile_by_email('johndoe@example.com')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/0x2C6/mockolate.  

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
