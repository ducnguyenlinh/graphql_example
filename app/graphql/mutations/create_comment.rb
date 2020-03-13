module Mutations
  class CreateComment < Mutations::BaseMutation
    argument :user_id, Int, required: true
    argument :post_id, Int, required: true
    argument :body, String, required: true

    field :comment, Types::CommentType, null: true
    field :errors, [String], null: false

    def resolve(user_id:, post_id:, body:)
      comment = Comment.new(user_id: user_id, post_id: post_id, body: body)

      if comment.save
        {
            comment: comment,
            errors: []
        }
      else
        {
            comment: nil,
            errors: comment.errors.full_messages
        }
      end
    end
  end
end
