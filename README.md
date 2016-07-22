gladys
======

## Description

指定時刻までの、いわゆる「秒読み」を読み上げます。
OS X専用のrubyスクリプトです。

## Synopsis

ruby gladys.rb 指定時刻 読み上げるべき時間 [読み上げるべき時間...]

## Options

* 指定時刻
  * 12:34のように24時間制のローカルタイムで指定

* 読み上げるべき時間
  * 数値: 秒
  * 数値m: 分
  * 数値h: 時間
  * 数値h数値m: 時分

## Sample

```
ruby gladys.rb 12:00 1 2 3
```
12:00になる3秒前、2秒前、1秒前に読み上げます。

```
ruby gladys.rb 15:00 1 2 3 10 30 1m 15m 1h 1h30m
```
15:00になる1時間半前、1時間前、15分前、1分前、30秒前、10秒前、3秒前、2秒前、1秒前に読み上げます。

```
ruby gladys.rb 14:00 1 2 3 4 5 6 7 8 9 10 15 30 1m 2m 3m 4m 5m 10m 15m 20m 30m 45m 1h 1h30m 2h
```
14:00に終了する2時間の時間制限ワークを読み上げるのにお勧めの例です。

## Requirement

```
$ gem install timers
```

OS Xの「システム環境設定」の「音声入力と読み上げ」の「テキスト読み上げ」にて、「システムの声」で「Kyoko」が使えることを確認してください。

## Licence

MIT Licence

## Author

[mrmt](https://github.com/mrmt)

name comes from the novel "The Andromeda Strain" by Michael Crichton.

> "Sorry," he said, "I wasn't sure how the thing worked. The voice is quite luscious."
>
> "The voice," said the supervisor heavily, "belongs to Miss Gladys Stevens, who is sixtythree years old. She lives in Omaha and makes her living taping messages for SAC crews and other voice-reminder systems."
>
> "Oh," Hall said.
