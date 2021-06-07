# Bootstrap 5 expandable list group

[![Build Status](https://travis-ci.org/bazzel/Bs5ExpandableListGroup.svg?branch=main)](https://travis-ci.org/bazzel/Bs5ExpandableListGroup)
[![Gem Version](https://badge.fury.io/rb/bs5_expandable_list_group.svg)](https://badge.fury.io/rb/bs5_expandable_list_group)

**Bootstrap 5 expandable list group** is a Ruby on Rails engine and gives you a simple API for creating expandable and stretchable list groups. A bit like [Bootstrap 5](https://getbootstrap.com/)'s [Accordion](https://getbootstrap.com/docs/5.0/components/accordion/), [Collapse](https://getbootstrap.com/docs/5.0/components/collapse/) and [List group](https://getbootstrap.com/docs/5.0/components/list-group/) components combined.

https://user-images.githubusercontent.com/7672/120296188-27170580-c2c8-11eb-936a-a93c16326acb.mp4

## TL;DR

```erb
<%= bs5_expandable_list_group do |c| %>
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

To render a **Bootstrap 5 expandable list group** you use `bs5_expandable_list_group` and pass it a block for rendering every list item.

Given that you have assigned a list of `Post` instances to `@posts`, to render these `@posts` in a **Bootstrap 5 expandable list group**, you put the following code in your template:

```erb
<%= bs5_expandable_list_group do |c| %>
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
      <% a.collapsed do %>
        <%= link_to 'Delete', post, method: :delete, class: 'btn btn-sm btn-outline-danger' %>
        <%= link_to 'Edit', edit_post_path(post), class: 'btn btn-sm btn-outline-secondary' %>
      <% end %>      
      <% a.expanded do %>
        <%= link_to 'Details', post_path(post), class: 'btn btn-sm btn-outline-secondary' %>
        <%= link_to 'Comment' ... %>
        <%= link_to 'Delete', post, method: :delete, class: 'btn btn-sm btn-outline-danger' %>
        <%= link_to 'Edit', edit_post_path(post), class: 'btn btn-sm btn-outline-secondary' %>
      <% end %>      
    <% end %>
    <%= i.body { ... } %>
  <% end %>
```

#### Bypassing the hover behaviour

By default, when an item is collapsed, actions only show when you hover your mouse over the item. Since we use the `visibility` CSS property for this, you can bypass this behaviour one or more actions by setting its `visibility` property to `visible`. The following example uses the [`visible` utility](https://getbootstrap.com/docs/5.0/utilities/visibility/) from Bootstrap 5, but of course you can also use CSS:

```erb
  ...
  <% c.item do |i| %>
    <%= i.title do |t| %>
      ...
    <% end %>
    <% i.actions do |a| %>
      <%= link_to 'Not so important link', ... %>
      <%= link_to 'Very important link', ..., class: 'visible` %>
    <% end %>      
    <%= i.body { ... } %>
  <% end %>
```

### Omitting the `item`'s methods

Instead of using the `item`'s methods `title`, `body` and/or `actions` you can just use (HTML-) text as a block.  
This will render just a [list group item](https://getbootstrap.com/docs/5.0/components/list-group/#basic-example), but will come in handy when you, i.e. show the first 25 items of a longer list and want to present a "Load more" link as last item of the list (for simplicity sake the sample uses a non-working `link_to_next_page` although this is [part of Kaminari](https://github.com/kaminari/kaminari#the-link_to_next_page-and-link_to_previous_page-aliased-to-link_to_prev_page-helper-methods)):

```erb
<%= bs5_expandable_list_group do |c| %>
  <% @posts.each do |post| %>
    <% c.item do |i| %>
      <%= i.title { post.title } %>
      <%= i.body  { post.text } %>
    <% end %>
  <% end %>
  <% if @posts.next_page %>
    <% c.item do %>
      <%= link_to_next_page @posts "Load more" %>
    <% end %>
  <% end %>
<% end %>
```

### Omitting the `item`

Instead of calling the `item` method on the yielded component, when you pass a block, it's rendered wrapped in the container element:

```erb
<%= bs5_expandable_list_group do %>
  <%= render @posts %>
<% end %>
```

This will give you the same results as wrapping the posts in a `div` with the class **list-group**, but you can still pass other options to the `bs5_expandable_list_group` (although not all of them will be effective).

### Rendering a single item

By calling the `item` method on the passed component you can render an item. But this can also be achieved outside the block by using the `bs5_expandable_list_group_item` helper method. The following snippet has the same result as other examples, but it does not use the `bs5_expandable_list_group` method:

```erb
<div id="posts" class="list-group">
  <% @posts.each do |post| %>
    <% bs5_expandable_list_group_item(parent_id: 'posts') do |i| %>
      <%= i.title { post.title } %>
      <%= i.body  { post.text } %>
    <% end %>
  <% end %>
</div>
```

An application for rendering a single item is when you want to update an item without doing a full page reload by sending a response that contains only the list item and use JavaScript or (preferably) [Turbo](https://turbo.hotwire.dev/) to update the page.

#### Passing options

The following options can be passed to `bs5_expandable_list_group_item`:

| name  |  default | description |
|---|---|---|
| `tag` | `:div` | A symbol or string of a valid HTML tag that is used for the tag of the list item. |
| `parent_id` |  | ID of a parent element to add accordion-like behaviour. |
|  `stretchable` | `false`  | Expanded items are shown a little bit bigger as if they come out a bit. |


### Wrap an item in an extra element

Every list item is a `div` (or the element specified with `tag`) with one or more CSS classes and, dependent on block passed, some `data` attributes.  
However, you can wrap a list item in a extra element by passing a `wrapper_html` option to the `item` method:

```erb
  ...
  <% c.item(wrapper_html: { tag: :turbo_frame, id: dom_id(post) }) do |i| %>
    <%= i.title do |t| %>
      <%= t.collapsed { 'Collapsed title' } %>
      <%= t.expanded { 'Expanded title' } %>
    <% end %>
    <%= i.body { ... } %>
  <% end %>
```

All options passed to the item method are used as HTML attributes of the wrapper, expect for the following:

| name  |  default | description |
|---|---|---|
| `tag` | `:div` | A symbol or string of a valid HTML tag that is used for the tag of the wrapper |

### Passing options

The following options can be passed to `bs5_expandable_list_group`:

| name  |  default | description |
|---|---|---|
| `tag` | `:div` | A symbol or string of a valid HTML tag that is used for the tag of the list group. |
|  `id` |   | is used to assign an id HTML attribute to the rendered container. |
| `class`  |   | is added to the class attribute of the rendered container. |
|  `accordion` | `false`  | Behaves as an Bootstrap [accordion](https://getbootstrap.com/docs/5.0/components/accordion/) by having only 1 item expanded (only effective when used with `item` in the passed block). |
|  `stretchable` | `false`  | Expanded items are shown a little bit bigger as if they come out a bit. |

Example:

```erb
<%= bs5_expandable_list_group(accordion: true, expandable: true) do |c| %>
  ...
<% end %>
```

Other options are used as HTML attributes of the list group element.


## Running tests

```bash
$ bin/rails app:ci
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
