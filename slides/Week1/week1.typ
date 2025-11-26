#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "../my_emoji.typ": my_emoji

#import "@preview/numbly:0.1.0": numbly

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [機械学習勉強会　第1回],
    subtitle: [AIの世界へようこそ - 基礎と実践の第一歩],
    author: [furakuta],
    date: datetime.today(),
    institution: [KMC],
    logo: image("../assets/KMClogo_trans.png", width: 4em),
  )
)

#set text(lang: "ja", font: "UD Digi Kyokasho NP")

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

= Introduction

== 自己紹介

/ 名前: \ furakuta
/ 所属: \ 京都大学工学部情報学科1回生 \ KMC49代
/ 推し言語: \
  Rust #my_emoji.ferris
/ 近況: \ みんげーから逃避している \ アークナイツエンドフィールドクローズドβテストIIに申し込んだ

== 機械学習勉強会の目的

- 人工知能の基礎から応用までを体系的に学ぶ
#pause
- Rust#my_emoji.rust を用いたfrom scratch実装及びPytourch #my_emoji.pytourch, scikit-learn等のライブラリを使用した実践的な演習も行う
#pause
- アルゴリズムのみではなく、その*数学的背景*や研究史も重要視し最終的に参加者が自律的に論文などを通した学習ができるようになることを目指す

#focus-slide[
  そもそも人工知能(AI)とは？
]

== AIとは何か

#grid(
  columns: (1fr, 1fr),
  align: (left, center),
  [
    
  ],
  [
    #image("../assets/Alan_Turing_az_1930-as_években.jpg", height: 80%)
    Alan Mathison Turing (1912-1954)
  ]
)