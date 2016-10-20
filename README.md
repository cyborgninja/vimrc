vimrc
=====

mac純正のvimは7.3で、clipboardがONにならないためvim自体をちゃんとインストール。
その上で必要そうなプラグインやカラーリングを設定します。

## 1. vimのインストール

```
vim --version | grep clipboard
```
+clipboardと、+がついてたら大丈夫。なかったら、新しいのを入れる

```
brew install vim
```

## 2. deinをインストール

vimのパッケージ管理ソフトdein。これをインストール。
以前は、Neobundleで色々入れていたがShougoさん自身が暗黒の力を使ったほうがいいとのことで。

・[dein.vimを使ってみる](http://qiita.com/yoza/items/2f8bd33a18225754f346)
・[NeoBundle から dein.vim に乗り換えたら爆速だった話]((http://qiita.com/yoza/items/2f8bd33a18225754f346)

## 3. このgithub上の.vimrcを設置

好きなようにカスタマイズしてください

