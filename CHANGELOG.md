# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [UNRELEASED]

### Added

- Instead of calling the `item` method on the yielded component, when you pass a block, it's rendered wrapped in the container element.
- Added the `bs5_expandable_list_group_item` helper to render list items outside a block.

### Changed

- Use CSS `visibility` and positioning properties instead of `display` so the hover behaviour can be bypassed for (some) actions.


## [0.4.0] - 2021-06-03

### Added

- Helper method to simplify API.

## [0.3.1] - 2021-06-03

### Fixed

- Items with a `wrapper_html` were rendered twice 🤦.

## [0.3.0] - 2021-06-03

### Added

- Arguments passed to the component, are used as HTML attributes for the container element.
- Define the HTML tag used for the container by passing the `tag` option to the component.
- Wrap an item in an extra HTML element by passing a `wrapper_html` option.

## [0.2.0] - 2021-06-02

### Added

- Ability to render simple content by omitting the `item` methods and using a text as block.

## [0.1.0] - 2021-06-01

### Added

- Component for rendering a Bootstrap 5 expandable list group.
