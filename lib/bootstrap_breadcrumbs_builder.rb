# bootstrap builder for breadcrumbs_on_rails gem
class BootstrapBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @context.content_tag(:ul, class: 'breadcrumb') do
      @elements.collect do |element|
        render_element(element)
      end.join.html_safe
    end
  end

  def render_element(element)
    active = element.path.nil? || @context.current_page?(compute_path(element))

    @context.content_tag(:li, :class => (active ? 'breadcrumb-item active' : 'breadcrumb-item' )) do
      content = if element.path.nil?
        compute_name(element)
      else
        @context.link_to_unless_current(compute_name(element), compute_path(element), element.options)
      end

      content
    end
  end
end
