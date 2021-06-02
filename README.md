# Bootstrap 5 expandable list group

[![Build Status](https://travis-ci.org/bazzel/Bs5ExpandableListGroup.svg?branch=main)](https://travis-ci.org/bazzel/Bs5ExpandableListGroup)

**Bootstrap 5 expandable list group** is a Ruby on Rails engine and gives you a simple API for creating expandable and stretchable list groups. A bit like [Bootstrap 5](https://getbootstrap.com/)'s [Accordion](https://getbootstrap.com/docs/5.0/components/accordion/), [Collapse](https://getbootstrap.com/docs/5.0/components/collapse/) and [List group](https://getbootstrap.com/docs/5.0/components/list-group/) components combined.

https://user-images.githubusercontent.com/7672/120296188-27170580-c2c8-11eb-936a-a93c16326acb.mp4

## TL;DR

```erb
<%= render(Bs5::ExpandableListGroupComponent.new) do |c| %>
  <% @posts.each do |post| %>
    <% c.item do |i| %>
      <%= i.title { post.title } %>
      <%= i.body  { post.text } %>
    <% end %>
  <% end %>
<% end %>
```

## Features

- Choose to show a different title when the item is expanded
- Show one or more actions (buttons, links, icons, ...) when hovering over an item
- Choose to show a different set of items when the item is expanded
- When configured as an *accordion* only one item can expanded
- When configured as *expandable* expanded items are shown a little bit bigger as if they come out a bit.


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

Stylesheets are copied to `app/javascript/stylesheets`. If needed, you can add the following line to your `application.scss` to import them:

```scss
@import "bootstrap";
@import "stylesheets/expandable-items";
@import "stylesheets/stretchable-items";
```

## Usage

To render a **Bootstrap 5 expandable list group** you use `render(Bs5::ExpandableListGroupComponent.new)` and pass it a block for rendering every list item.

Let's say, in the `index` action of your `PostsController`, you have assigned `@posts` that contains a list of `Post` instances. To render these `@posts` in a **Bootstrap 5 expandable list group**, you put the following code in your `index.html.erb` template:

```erb
<%= render(Bs5::ExpandableListGroupComponent.new) do |c| %>
  <% @posts.each do |post| %>
    <% c.item do |i| %>
      <%= i.title { post.title } %>
      <%= i.body  { post.text } %>
    <% end %>
  <% end %>
<% end %>
```

This will render a [List group](https://getbootstrap.com/docs/5.0/components/list-group/) showing the title of every post. When you click a title, it will expand the item and the text of the post will be shown.

You are not limited to passing a simple attribute as title or body:

```erb
  ...
  <% c.item do |i| %>
    <%= i.title do %>
      <div class="ms-2 me-auto">
        <div class="fw-bold"><%= post.title %></div>
        <%= post.author_name %>
      </div>
      <span class="badge bg-primary rounded-pill"><%= post.comments_count %></span>
    <% end %>
    <%= i.body { ... } %>
  <% end %>
```

### Show different titles

You can show a different title when the item is expanded then when it is collapsed. Use the `.collapsed` and `.expanded` methods on the `title` object:

```erb
  ...
  <% c.item do |i| %>
    <%= i.title do |t| %>
      <%= t.collapsed { 'Collapsed title' } %>
      <%= t.expanded { 'Expanded title' } %>
    <% end %>
    <%= i.body { ... } %>
  <% end %>
```

### Show actions

Actions can be used for defining links or buttons that will become visible when hovering over an item and are aligned to the right. When the item is expanded, the actions are permanently visible.

You can choose to either show one set of actions of using a different set when the item is expanded.

To show one set:

```erb
  ...
  <% c.item do |i| %>
    <%= i.title do |t| %>
		...
    <% end %>
    <% i.actions do %>
      <%= link_to 'Delete', post, method: :delete, class: 'btn btn-sm btn-outline-danger' %>
      <%= link_to 'Edit', edit_post_path(post), class: 'btn btn-sm btn-outline-secondary' %>
    <% end %>
    <%= i.body { ... } %>
  <% end %>
```

To show a different set on hovering:

```erb
  ...
  <% c.item do |i| %>
    <%= i.title do |t| %>
		...
    <% end %>
    <% i.actions do |a| %>
      <% a.collapsed %>
        <%= link_to 'Delete', post, method: :delete, class: 'btn btn-sm btn-outline-danger' %>
        <%= link_to 'Edit', edit_post_path(post), class: 'btn btn-sm btn-outline-secondary' %>
      <% end %>      
      <% a.expanded %>
        <%= link_to 'Details', post_path(post), class: 'btn btn-sm btn-outline-secondary' %>
        <%= link_to 'Comment' ... %>
        <%= link_to 'Delete', post, method: :delete, class: 'btn btn-sm btn-outline-danger' %>
        <%= link_to 'Edit', edit_post_path(post), class: 'btn btn-sm btn-outline-secondary' %>
      <% end %>      
    <% end %>
    <%= i.body { ... } %>
  <% end %>
```

### Passing options

The following options can be passed to `Bs5::ExpandableListGroupComponent.new`:

| name  |  default | description |
|---|---|---|
|  `id` |   | is used to assign an id HTML attribute to the rendered container |
| `class`  |   | is added to the class attribute of the rendered container |
|  `accordion` | `false`  | Behaves as an Bootstrap [accordion](https://getbootstrap.com/docs/5.0/components/accordion/) by having only 1 item expanded |
|  `expandable` | `false`  | Expanded items are shown a little bit bigger as if they come out a bit|


Example:

```erb
<%= render(Bs5::ExpandableListGroupComponent.new(accordion: true, expandable: true) do |c| %>
  ...
<% end %>
```

## Running tests

```bash
$ bin/rails app:ci
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
