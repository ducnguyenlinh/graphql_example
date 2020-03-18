module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :user_id, Int, required: true
    argument :subject, String, required: false
    argument :body, String, required: false

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(user_id:, subject:, body:)
      post = Post.new(user_id: user_id, subject: subject, body: body)

      if post.save
        {
            post: post,
            errors: []
        }
      else
        {
            post: nil,
            errors: post.errors.full_messages
        }
      end
    end
  end
end
