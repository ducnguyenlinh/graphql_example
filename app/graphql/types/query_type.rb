module Types
  class QueryType < Types::BaseObject
    # ==================================================================================================================
    # User
    # ==================================================================================================================
    # index
    field :users, [Types::UserType], null: false, description: 'ユーザ情報を全件取得する'
    def users
      User.all
    end

    # show
    field :user, Types::UserType, null: false do
      description 'ユーザ情報を1件取得する'
      argument :id, Int, required: true, description: 'ユーザID'
    end
    def user(id:)
      User.find_by(id: id)
    end

    # ==================================================================================================================
    # Post
    # ==================================================================================================================
    # index
    field :posts, [Types::PostType], null: false, description: 'ポスト情報を全件取得する'
    def posts
      Post.all
    end

    # show
    field :post, Types::PostType, null: false do
      description 'ポスト情報を1件取得する'
      argument :id, Int, required: true, description: 'ポストID'
    end
    def post(id:)
      Post.find_by(id: id)
    end

    # ==================================================================================================================
    #Comment
    # ==================================================================================================================
    # index
    field :comments, [Types::CommentType], null: false, description: 'コメント情報を全件取得する'
    def comments
      Comment.all
    end

    # show
    field :comment, Types::CommentType, null: false do
      description 'コメント情報を1件取得する'
      argument :id, Int, required: true, description: 'コメントID'
    end
    def comment(id:)
      Comment.find_by(id: id)
    end
  end
end
