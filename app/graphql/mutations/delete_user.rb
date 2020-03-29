module Mutations
  class DeleteUser < BaseMutation
    argument :id, ID, required: true

    field :destroyed, Boolean, null: true

    def resolve(**args)
      user = User.find_by(id: args[:id])
      raise "Couldn't find User with 'id'=#{args[:id]}" unless user

      user.destroy!

      { destroyed: true }
    rescue => e
      return GraphQL::ExecutionError.new(e.message)
    end
  end
end
