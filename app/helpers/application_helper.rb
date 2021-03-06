module ApplicationHelper
  include AuthHelper
  include CustomUrlHelper

  def navbar_link(label, path, options = {})
    patch = options[:with]

    if patch
      label << " ("
      label << patch.to_s
      label << ")"
    end

    link_to label, path
  end

  def markdown(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    sanitized_content = sanitize content
    markdown.render(sanitized_content).html_safe
  end

  def nl2br(content)
    lines = content.split(/\r\n/)
    render 'helpers/web/nl2br', lines: lines
  end

  def dropdown(args)
    render 'helpers/web/dropdown', name: args[:name], items: args[:items]
  end

  def item(tag, name, path, link_options = {}, &block)
    options = {}
    options[:class] = :active if current_page?(path)
    link = link_to(name, path, link_options)
    content_tag(:li, link, options)
  end

  #FIXME запросы из хелпера - плохая идея. придумать другое решение.
  def new_lectures_count
    @new_lectures = Lecture.new_lectures.count
  end

end
