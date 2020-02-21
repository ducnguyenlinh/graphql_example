module Types
  class QueryType < Types::BaseObject
    # User
    #
    field :user, Types::UserType, null: false do
      description 'ユーザ情報を1件取得する'
      argument :id, Int, required: true, description: 'ユーザID'
    end
    def user(id:)
      User.find(id)
    end

    field :users, [Types::UserType], null: false, description: 'ユーザ情報を全件取得する'
    def users
      User.all
    end

    # Post
    #
    field :post, Types::PostType, null: false do
      description 'ポスト情報を1件取得する'
      argument :id, Int, required: true, description: 'ポストID'
    end
    def post(id:)
      Post.find(id)
    end
    field :posts, [Types::PostType], null: false, description: 'ポスト情報を全件取得する'
    def posts
      Post.all
    end

    #Comment
    #
    field :comment, Types::CommentType, null: false do
      description 'コメント情報を1件取得する'
      argument :id, Int, required: true, description: 'コメントID'
    end
    def comment(id:)
      Comment.find(id)
    end
    field :comments, [Types::CommentType], null: false, description: 'コメント情報を全件取得する'
    def comments
      Comment.all
    end
  end
end
