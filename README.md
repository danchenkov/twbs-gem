# README

Notice bootstrap styles can be overridden here.

I am trying to choose the best of at least approproate Asset Pipeline for my apps.

The project is using Bootstrap 5, not so much for styles and perks, but mainly because it illustrates the use of external library with JS and CSS components. JS part has dependency on popper.js and CSS part has optional config for Sass.

| Technology       | Description               |
| ---------------- | ------------------------- |
| Asset Pipeline   | sprockets                 |
| Bootstrap        | gem                       |
| Sass processing  | sassc-rails               |
| CSS minification | sprockets via manifest.js |
| JS minification  | sprockets via manifest.js |
| Naming           | importmaps                |
| Bundling         | sprockets via manifest.js |

### Basic needs for a quick start

- bundled and minified Bootstrap 5
- Sass compilation
- CSS and JS minification for production
- assets fingerprinting for production

From [Ruby Guides](https://guides.rubyonrails.org/asset_pipeline.html)

#### 2.4 Manifest Files and Directives
Sprockets uses manifest files to determine which assets to include and serve. These manifest files contain directives - instructions that tell Sprockets which files to require in order to build a single CSS or JavaScript file. With these directives, Sprockets loads the files specified, processes them if necessary, concatenates them into one single file, and then compresses them (based on value of Rails.application.config.assets.js_compressor). By serving one file rather than many, the load time of pages can be greatly reduced because the browser makes fewer requests. Compression also reduces file size, enabling the browser to download them faster.

For example, with a app/assets/javascripts/application.js file containing the following lines:

// ...
//= require rails-ujs
//= require turbolinks
//= require_tree .

In JavaScript files, Sprockets directives begin with //=. In the above case, the file is using the require and the require_tree directives. The require directive is used to tell Sprockets the files you wish to require. Here, you are requiring the files rails-ujs.js and turbolinks.js that are available somewhere in the search path for Sprockets. You need not supply the extensions explicitly. Sprockets assumes you are requiring a .js file when done from within a .js file.

The require_tree directive tells Sprockets to recursively include all JavaScript files in the specified directory into the output. These paths must be specified relative to the manifest file. You can also use the require_directory directive which includes all JavaScript files only in the directory specified, without recursion.

Directives are processed top to bottom, but the order in which files are included by require_tree is unspecified. You should not rely on any particular order among those. If you need to ensure some particular JavaScript ends up above some other in the concatenated file, require the prerequisite file first in the manifest. Note that the family of require directives prevents files from being included twice in the output.

Rails also creates a default app/assets/stylesheets/application.css file which contains these lines:

/* ...
 *= require_self
 *= require_tree .
 */

Rails creates app/assets/stylesheets/application.css regardless of whether the --skip-asset-pipeline option is used when creating a new Rails application. This is so you can easily add asset pipelining later if you like.

The directives that work in JavaScript files also work in stylesheets (though obviously including stylesheets rather than JavaScript files). The require_tree directive in a CSS manifest works the same way as the JavaScript one, requiring all stylesheets from the current directory.

In this example, require_self is used. This puts the CSS contained within the file (if any) at the precise location of the require_self call.

If you want to use multiple Sass files, you should generally use the Sass @import rule instead of these Sprockets directives. When using Sprockets directives, Sass files exist within their own scope, making variables or mixins only available within the document they were defined in.

You can do file globbing as well using @import "*", and @import "**/*" to add the whole tree which is equivalent to how require_tree works. Check the sass-rails documentation for more info and important caveats.

You can have as many manifest files as you need. For example, the admin.css and admin.js manifest could contain the JS and CSS files that are used for the admin section of an application.

The same remarks about ordering made above apply. In particular, you can specify individual files and they are compiled in the order specified. For example, you might concatenate three CSS files together this way:

/* ...
 *= require reset
 *= require layout
 *= require chrome
 */

#### 2.5 Preprocessing
The file extensions used on an asset determine what preprocessing is applied. When a controller or a scaffold is generated with the default Rails gemset, an SCSS file is generated in place of a regular CSS file. The example used before was a controller called "projects", which generated an app/assets/stylesheets/projects.scss file.

In development mode, or if the asset pipeline is disabled, when this file is requested it is processed by the processor provided by the sass-rails gem and then sent back to the browser as CSS. When asset pipelining is enabled, this file is preprocessed and placed in the public/assets directory for serving by either the Rails app or web server.

Additional layers of preprocessing can be requested by adding other extensions, where each extension is processed in a right-to-left manner. These should be used in the order the processing should be applied. For example, a stylesheet called app/assets/stylesheets/projects.scss.erb is first processed as ERB, then SCSS, and finally served as CSS. The same applies to a JavaScript file - app/assets/javascripts/projects.coffee.erb is processed as ERB, then CoffeeScript, and served as JavaScript.

Keep in mind the order of these preprocessors is important. For example, if you called your JavaScript file app/assets/javascripts/projects.erb.coffee then it would be processed with the CoffeeScript interpreter first, which wouldn't understand ERB and therefore you would run into problems.


#### JS handling

Importmaps is included. It allows simpler reference providing a nickname to imported JS assets (whether CDN or gem or vendor folder or local folder). JS libraries have to be modularized. References can be quickly swapped (say, from gem to CDN) without changing a nickname.
JS source folder with umninified, unbundled assets is currently under `app/javascript`, not `app/assets/javascript`.

#### Sass / CSS handling

There are essentially two libraries to handle Sass files - sassc and Dart Sass. The pluapoint of sassc-rails is that no separate command is needed to watch the sass changes.
sassc-rails takes stylesheet `app/assets/stylesheets/application.scss` and serves it as minified, signed asset from `/assets`.
See: [https://dev.to/coorasse/rails-7-bootstrap-5-and-importmaps-without-nodejs-4g8]

#### Asset Pipeline

Propshaft does not minify assets, it only handles assets paths and digital stamping / fingerprinting. Since if handles paths, it decodes `url(asset)` to `url(digested-asset)` in CSS files. Apparently CSS files do not have to be ERB for that to work.
