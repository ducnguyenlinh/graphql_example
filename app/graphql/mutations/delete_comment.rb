module Mutations
  class DeleteComment < BaseMutation
    argument :id, ID, required: true

    field :destroyed, Boolean, null: true

    def resolve(**args)
      comment = Comment.find_by(id: args[:id])
      raise "Couldn't find Comment with 'id'=#{args[:id]}" unless comment

      comment.destroy!

      { destroyed: true }
    rescue => e
      return GraphQL::ExecutionError.new(e.message)
    end
  end
end
