module Mutations
  class UpdateUser < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: true

    field :user, Types::UserType, null: true

    def resolve(**args)
      user = User.find_by(id: args[:id])
      raise "user id: #{args[:id]} not found" unless user

      attributes = { email: args[:email] }
      attributes.merge!(name: args[:name]) if args[:name]
      user.attributes = attributes
      user.save

      { user: user }
    rescue => e
      return GraphQL::ExecutionError.new(e.message)
    end
  end
end
