class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :account

attr_accessor :return_to

after_create :increase_post_comment_counter
after_destroy :decreaes_post_comment_counter

private
def increase_post_comment_counter
  Post.find(self.post_id).increment(:total_comment_count).save
end
def decreaes_post_comment_counter
  Post.find(self.post_id).decrement(:total_comment_count).save
end
end
