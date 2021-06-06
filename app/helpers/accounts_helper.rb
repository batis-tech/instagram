module AccountsHelper
  def profile_picture account
    image_path = account.image.url.present? ? account.image.url : "default.jpeg"
    image_tag(image_path, width:"40px",class:"img-circle")
  end

  def can_edit_profile? profile_id
    account_signed_in? && current_account.id = profile_id
  end
end
