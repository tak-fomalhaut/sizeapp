# App name
Just me&

# Summary
With this app, you can share the size of your favorite clothes and search for them.  
このアプリを使えば好きな洋服のサイズ感を共有したり検索して教えてもらうことができます。  
### Mounted Function  
User(devise)  
deviseを用いたユーザー機能  
Post new,edit,show,destroy(text,image)  
投稿機能　新規、編集、詳細、削除(textとimage)  
Comment for Post  
ユーザーと投稿に紐づいたコメント機能  
Search(ambiguous keyword)  
あいまい検索機能  
Like it  
いいね機能  
Follow  
フォロー機能  

# Intention
I've had the experience of failing in size many times because I can't try on clothes when I buy them online.  
I would like to have a tool that can share information about clothes like sharing information about restaurants.  
I think that if makers enter the market in the future, they will have a good relationship with shopping sites.  
アプリを作成した背景には自分自身の失敗の経験があります。  
オンラインで洋服を購入するとき表示されているサイズだけを信用して購入し、実際に着てみてサイズが合わないということがありました。  
事前にサイズ感を検索しても商品によって情報はまちまち。  
メーカー毎やシーズン毎に同じサイズでも実際のサイズ感は違うので紛らわしい。  
今後オンラインでの洋服の購入需要はさらに高まる中、返品無料サービスもいいがスピード感とコストを考えると消費者側が同じブランド好きなどのコミュニティで情報を共有し合いサイズ感がわかると購入の機会も増えると思いましたし失敗がなくなると思いました。  
事実メルカリなどのサイトを見るとせっかく購入したのにサイズが合わなくて新品同様のものを出品している方はとても多いです。  
メーカーと消費者がWINWINの関係を築けるこのアプリにたくさんのメーカーさんに参入していただければオンラインショッピング業界がさらに盛り上がると思っています。

# Demo
TOP PAGE  
![トップページ](/app/assets/images/sample_top.png)  
Post New  
![投稿ページ](/app/assets/images/sample_post.png)  
Search Index  
![検索結果ページ](/app/assets/images/sample_search.png)  
Post Show  
![投稿詳細ページ](/app/assets/images/sample_show.png)  

# Mounting Planned  
### Multiple images  
現状単一の画像のみ投稿、保存されるが複数画像機能を追加  
### AJAX  
現状いいね機能やフォロー機能に非同期通信が設定されていないので追加  
### Category(ancestry)  
カテゴリ機能追加  
### Brand  
ブランドタグ機能追加  
### Size(active_hush)  
現状サイズなどは投稿時、おおまかな説明の一つとして入力しているがactive_hushを用いて追加  

# Database Design
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :posts
- has_many :comments

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
- has_many :posts

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :size
- has_many :comments
- has_many :posts_tags
- has_many  :tags,  through:  :posts_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :posts_tags
- has_many  :posts,  through:  :posts_tags

## posts_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user
