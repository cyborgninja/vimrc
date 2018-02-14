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

```
$ mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
$ git clone https://github.com/Shougo/dein.vim.git \
    ~/.vim/dein/repos/github.com/Shougo/dein.vim
```

上記の２つのコマンドでdeinがインストールされます。
※ sh コマンドで入れるパターンもある。=> 公式参照: [dein 公式](https://github.com/Shougo/dein.vim)

参考
* [dein.vimを使ってみる](https://qiita.com/yoza/items/2f8bd33a18225754f346)
* [NeoBundle から dein.vim に乗り換えたら爆速だった話](https://qiita.com/delphinus/items/00ff2c0ba972c6e41542)

## 3. このgithub上の.vimrcを設置

コピペしてそのままでも、好きなようにカスタマイズしてでも。基本設置するだけ。

## 4.インストール
コマンドラインから、vimと打って、vimを起動して、vim上内で以下のコマンドを実行

```
:call dein#install()
```

