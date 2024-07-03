# Accountの扱い
### 全ユーザーごとに持つ共通のテーブル

以下、2つのテーブルを合わせて、Accountとする。

- AuthInfo
    - ログイン用のテーブル
- UserInfo
    - ユーザーの基礎情報
- Client = AuthInfo + UseInfo + ClientInfo
- Owner = AuthInfo + UseInfo + BusinessOwnerInfo


## Userと各種AuthRoleの取り扱い

- User: 以下 AuthRole
    - admin = 1: アプリ全体の管理者 (owner権限+全てのデータにアクセス権限)
    - owner = 2: ビジネスアカウント
    - branch = 3: ビジネス支店アカウント(１店舗の場合でも必要、責任者レベル)
    - superStaff = 4: クライアントの担当上位のスタッフ
    - staff = 5: クライアントの担当スタッフ
    - client = 6: ビジネスアカウントの顧客
    - guest = 7: 未登録会員

### 全ユーザーごとに持つ共通のテーブル
- AuthInfo
    - ログイン用のテーブル
- UserInfo
    - ユーザーの基礎情報


- BusinessOwnerInfo
- BusinessBranchInfo

# Mongoのスキーマ

キーは日本語でもいいようにするか〜


# ユースケース

## 顧客情報を登録する

1. Guest用の登録画面から認証情報を入力して「仮登録」を押下する
2. メールを受け取って、URLを踏んで本人確認画面に飛ぶ
3. メールとパスワードとワンタイムパスを
4. ログインして、認証用の本登録画面に飛ぶ
5. 認証用の本登録画面で
   - ユーザー情報(住所等)を入力する
   - 店舗と担当者を指定する ※任意。店頭ならスタッフがここで選択する
   - 「本登録」を押下する