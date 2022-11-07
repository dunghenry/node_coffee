const path = require('path');
const nodeExternals = require('webpack-node-externals');
module.exports = {
    entry: './src/index.coffee',
    output: {
        path: path.resolve(__dirname, 'build'),
        filename: 'bundle.js',
    },
    module: {
        rules: [
            {
                test: /\.(coffee)$/,
                exclude: /node_modules/,
                use: {
                    loader: 'coffee-loader',
                    options: {
                        presets: ['@babel/preset-env'],
                    },
                },
            },
        ],
    },
    resolve: {
        extensions: ['*', '.coffee', '.js'],
    },
    target: 'node',
    externals: [nodeExternals()],
    mode: 'development',
};
