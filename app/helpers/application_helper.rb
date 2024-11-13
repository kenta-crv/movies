module ApplicationHelper
  def default_meta_tags
    {
      site: "映像制作・映像編集の一括見積なら『ムービーズ』",
      title:"<%= yield(:title) | ムービーズ' %>",
      description: "映像制作・映像編集の一括見積なら『ムービーズ』",
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
