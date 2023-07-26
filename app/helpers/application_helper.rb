module ApplicationHelper
  def default_meta_tags
    {
      site: "システム開発なら一括見積のENGIST",
      title:"<%= yield(:title) | ENGIST' %>",
      description: "システム開発なら一括見積のENGIST",
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
