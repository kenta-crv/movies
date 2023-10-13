module ApplicationHelper
  def default_meta_tags
    {
      site: "営業・販売に特化した人材紹介なら『セールスプロ』",
      title:"<%= yield(:title) | セールスプロ' %>",
      description: "営業・販売に特化した人材紹介なら『セールスプロ』",
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
