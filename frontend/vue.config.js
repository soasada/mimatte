// vue.config.js
module.exports = {
    // proxy all webpack dev-server requests starting with /api/v1
    // to our Spring Boot backend (localhost:8088) using http-proxy-middleware
    // see https://cli.vuejs.org/config/#devserver-proxy
    devServer: {
        proxy: {
            '/api/v1': {
                target: 'http://localhost:8088',
                ws: true,
                changeOrigin: true
            }
        }
    },
    // Change build paths to make them Maven compatible
    // see https://cli.vuejs.org/config/
    outputDir: 'target/dist',
    assetsDir: 'static',
    filenameHashing: false,
    pages: {
        index: {
            entry: './src/pages/home/main.ts',
            template: 'public/index.html',
            title: 'Centro de estética y relajación',
            chunks: ['chunk-vendors', 'chunk-common', 'index']
        },
        about: {
            entry: './src/pages/about/main.ts',
            template: 'public/index.html',
            title: 'Sobre nosotros',
            chunks: ['chunk-vendors', 'chunk-common', 'about']
        }
    }
};
