module Mutations
  class UpdatePost < BaseMutation
    argument :id, ID, required: true
    argument :user_id, Int, required: false
    argument :subject, Int, required: false
    argument :body, Int, required: false

    field :post, Types::PostType, null: true

    def resolve(**args)
      post = Post.find_by(id: args[:id])
      raise "post id: #{args[:id]} not found" unless post

      @attributes = {}
      merge_post_attributes(**args)
      post.attributes = @attributes
      post.save

      { post: post }
    rescue => e
      return GraphQL::ExecutionError.new(e.message)
    end

    private

    def merge_post_attributes(**args)
      if args.key?(:user_id)
        user_id = args[:user_id]
        user = User.find_by(id: user_id)
        raise "user id: #{user_id} not found" unless user

        @attributes.merge!(user_id: user_id)
      end

      @attributes.merge!(subject: args[:subject]) if args.key?(:subject)
      @attributes.merge!(body: args[:body]) if args.key?(:body)
    end
  end
end
