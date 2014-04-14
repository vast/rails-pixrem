Rails-pixrem
===================================================================

CSS post-processor which generates pixel fallbacks for rem units
in your Rails (Sinatra) application.


Usage
===================================================================

### Ruby on Rails

Add `rails-pixrem` to your `Gemfile`:

```ruby
gem 'rails-pixrem', github: 'vast/rails-pixrem'
```

Write your CSS (SASS, Stylus, LESS) using `rem`s:

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


### Sprockets

If you use a non-Rails framework with Sprockets, connect Sprockets environment
with `RailsPixrem`:


```ruby
assets = Sprockets::Environment.new do |env|
  # ...
end

require 'rails-pixrem'
RailsPixrem.install(assets)
```

## Configuration

You can specify root element font size (default: '16px') in px, em or percents:

### Ruby On Rails

```yaml
# config/pixrem.yml
root_value: 24px
```

### Sprockets

```ruby
RailsPixrem.install(assets, root_value: '85%')
```
