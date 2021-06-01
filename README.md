# Bootstrap 5 expandable list group

https://github.com/bazzel/Bs5ExpandableListGroup/blob/main/images/example01.mp4

## Usage

How to use my plugin.

## Prerequisites

- [Stimulus](https://github.com/hotwired/stimulus-rails) or [Hotwire](https://github.com/hotwired/hotwire-rails) added to your project
- [Bootstrap 5](https://getbootstrap.com/) added to your project. There are different ways to do this, but you should use [Yarn](https://getbootstrap.com/docs/5.0/getting-started/download/#rubygems) with Webpacker.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bs5_expandable_list_group'
```

And then execute:

```bash
$ bundle
```

Run the following command to setup your project to use Bootstrap 5 expandable list group:

```bash
$ bin/rails generate bs5_expandable_list_group:install
```

This copies the required assets to your application directory:

Stylesheets are copied to `app/javascript/stylesheets`. If needed, you can the following line to your `application.scss` to import them:

```ssss
@import "bootstrap";
@import "stylesheets/expandable-items";
@import "stylesheets/stretchable-items";
```

When you use Webpacker for your CSS, you should move these added stylesheets to the proper location (propably somewhere in `app/javascript` and import them in `application.scss` (or alike) located there.

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
