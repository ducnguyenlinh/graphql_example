module Mutations
  class DeletePost < BaseMutation
    argument :id, ID, required: true

    field :destroyed, Boolean, null: true

    def resolve(**args)
      post = Post.find_by(id: args[:id])
      raise "Couldn't find Post with 'id'=#{args[:id]}" unless post

      post.destroy!

      { destroyed: true }
    rescue => e
      return GraphQL::ExecutionError.new(e.message)
    end
  end
end
