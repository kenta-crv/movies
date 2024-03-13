module ApplicationHelper
  def default_meta_tags
    {
      site: "介護専門転職なら『ケアリンク』",
      title:"<%= yield(:title) | ケアリンク' %>",
      description: "介護専門転職なら『ケアリンク』",
      canonical: request.original_url,  # 優先されるurl
      charset: "UTF-8",
      reverse: true,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('favicon.ico'),  rel: 'apple-touch-icon' },
      ],
	    canonical: request.original_url  # 優先されるurl

    }
  end
end
