# README

I am trying to choose the best of at least approproate Asset Pipeline for my apps.

The project is using Bootstrap 5, not so much for styles and perks, but mainly because it illustrates the use of external library with JS and CSS components. JS part has dependency on popper.js and CSS part has optional config for Sass.

### Basic needs for a quick start

- bundled and minified Bootstrap 5
- Sass compilation
- CSS and JS minification for production
- assets fingerprinting for production

#### JS handling

Importmaps is included. It allows simpler reference providing a nickname to imported JS assets (whether CDN or gem or vendor folder or local folder). JS libraries have to be modularized. References can be quickly swapped (say, from gem to CDN) without changing a nickname.
JS source folder with umninified, unbundled assets is currently under `app/javascript`, not `app/assets/javascript`.

#### Sass / CSS handling

There are essentially two libraries to handle Sass files - sassc and Dart Sass. The pluapoint of sassc-rails is that no separate command is needed to watch the sass changes.
sassc-rails takes stylesheet `app/assets/stylesheets/application.scss` and serves it as minified, signed asset from `/assets`.
See: [https://dev.to/coorasse/rails-7-bootstrap-5-and-importmaps-without-nodejs-4g8]

#### Asset Pipeline

Propshaft does not minify assets, it only handles assets paths and digital stamping / fingerprinting. Since if handles paths, it decodes `url(asset)` to `url(digested-asset)` in CSS files. Apparently CSS files do not have to be ERB for that to work.

-----

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
