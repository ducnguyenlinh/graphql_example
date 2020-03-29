module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UpdateUser
    field :update_post, mutation: Mutations::UpdatePost
    field :update_comment, mutation: Mutations::UpdateComment

    field :delete_user, mutation: Mutations::DeleteUser
    field :delete_post, mutation: Mutations::DeletePost
    field :delete_comment, mutation: Mutations::DeleteComment
  end
end
