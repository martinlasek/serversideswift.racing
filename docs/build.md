# Build
### VueJS
##### Command
```
npm run build
```
##### Changes
In `Frontend/config/index.js`. <br/>
OLD
```
...
index: path.resolve(__dirname, '../../Resources/Views/index.html'),
assetsRoot: path.resolve(__dirname, '../dist'),
...
```
NEW
```
...
index: path.resolve(__dirname, '../../Public/index.html'),
assetsRoot: path.resolve(__dirname, '../../Public'),
...
```
<br />

In `Frontend/build/webpack.prod.conf.js`. <br/>
OLD
```
...
filename: utils.assetsPath('js/[name].[chunkhash].js'),
...
filename: utils.assetsPath('css/[name].[contenthash].css')
...
```
NEW
```
...
filename: utils.assetsPath('js/[name].js'),
...
filename: utils.assetsPath('css/[name].css')
...
```