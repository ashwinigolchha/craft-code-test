let mix = require('laravel-mix');
let fs = require('fs');

// Mix Public Path
mix.setPublicPath('web');

// Mix Options
mix.options({
    clearConsole: Mix.isWatching()
});



// Asset Config
mix.webpackConfig({
    watchOptions: {
        poll: Mix.isPolling() ? 1700 : false,
        aggregateTimeout: 600,
    },
});


let getFiles = function (dir) {
    return fs.readdirSync(dir).filter(file => {
        return fs.statSync(`${dir}/${file}`).isFile();
    });
};

// Get all JS and output to individual files
getFiles('resources/js').forEach(function (filepath) {
    mix.js('resources/js/' + filepath, 'assets/js');
});

// Do the rest
mix.sass('resources/sass/styles.scss', 'assets/css')
    .extract()
    .sourceMaps()
    .version();
