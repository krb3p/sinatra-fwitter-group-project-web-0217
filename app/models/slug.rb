module Slugify

  def slug
    username.downcase.strip.gsub(' ','-')
  end

end

module SelfSlug

  def find_by_slug(slug)
    all.find {|user| user.slug == slug}
  end

end
