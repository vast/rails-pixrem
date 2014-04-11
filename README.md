Rails-pixrem
==================================================================

CSS post-processor which generates pixel fallbacks for rem units
in your Rails (Rack) application.


Usage
===================================================================

### Ruby On Rails

Add `rails-pixrem` to your `Gemfile`:

```ruby
gem 'rails-pixrem', github: 'vast/rails-pixrem'
```

Write your CSS (SASS, Stylus, LESS) using `rem`:

```scss
#header {
  font-size: 2rem;
}
```

Rails-pixrem will automatically add fallback rules with pixel values:

```scss
#header {
  font-size: 32px; // IE8, Opera Mini
  font-size: 2rem; // modern browsers
}
```
