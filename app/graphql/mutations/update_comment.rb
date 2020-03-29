module Mutations
  class UpdateComment < BaseMutation
    argument :id, ID, required: true
    argument :body, String, required: true
    argument :user_id, Int, required: false
    argument :post_id, Int, required: false

    field :comment, Types::CommentType, null: true

    def resolve(**args)
      comment = Comment.find_by(id: args[:id])
      raise "comment id: #{args[:id]} not found" unless comment

      @attributes = { body: args[:body] }
      merge_comment_attributes(**args)
      comment.attributes = @attributes
      comment.save

      { comment: comment }
    rescue => e
      return GraphQL::ExecutionError.new(e.message)
    end

    private

    def merge_comment_attributes(**args)
      if args.key?(:user_id)
        user_id = args[:user_id]
        user = User.find_by(id: user_id)
        raise "user id: #{user_id} not found" unless user

        @attributes.merge!(user_id: user_id)
      end

      if args.key?(:post_id)
        post_id = args[:post_id]
        post = Post.find_by(id: post_id)
        raise "user id: #{post_id} not found" unless post

        @attributes.merge!(user_id: post_id)
      end
    end
  end
end
