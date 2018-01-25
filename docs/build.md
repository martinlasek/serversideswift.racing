# Build
### VueJS
##### Command
```
npm run build
```
##### Changes
In `Frontend/config/index.js`. <br/>
```
...
index: path.resolve(__dirname, '../../Resources/Views/index.html'),
assetsRoot: path.resolve(__dirname, '../../Public'),
...
```
<br />

In `Frontend/build/webpack.prod.conf.js`. <br/>
```
...
filename: utils.assetsPath('js/[name].js'),
...
filename: utils.assetsPath('css/[name].css')
...
```
