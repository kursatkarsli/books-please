module ApplicationHelper
  def t_enum(model, attribute)
    I18n.t "activerecord.attributes.#{model.class.to_s.downcase}.#{attribute}.#{model[attribute]}"
  end

  def favourite_link
    link_to toggle_book_path(@book, favourite: true) do
      name = @interest.is_favourite ? 'star' : 'star-o'
      icon name, 'fa-2x text-warning'
    end
  end

  def status_tag
    case @interest.status.to_sym
    when :read_list
      badge 'To read', 'secondary'
    when :reading
      badge 'Currently reading', 'primary'
    when :completed
      badge 'Completed', 'success'
    when :rejected
      badge 'Rejected', 'danger'
    end
  end

  def toggle_status_link
    case @interest.status.to_sym
    when :uninterested
      toggle_link({ read_list: true }, 'secondary', 'book', 'Want to read')
    when :read_list
      toggle_link({ reading: true }, 'primary', 'newspaper-o', 'Started reading')
    when :reading
      content_tag :div do
        concat toggle_link({ complete: true }, 'success', 'check', 'Finished reading')
        concat toggle_link({ reject: true }, 'danger', 'close', 'Cancelled reading')
      end
    when :completed, :rejected
      toggle_link({ forget: true }, 'secondary', 'trash', 'Forget the book')
    end
  end

  private

  def icon(name, style = '')
    content_tag(:i, '', class: "fa fa-#{name} #{style}")
  end

  def badge(text, color = '')
    content_tag(:span, text, class: "badge badge-pill badge-#{color}")
  end

  def toggle_link(param, color, icon_name, text)
    style = "btn btn-#{color} m-1"
    link_to toggle_book_path(@book, param), class: style do
      concat icon icon_name
      concat ' '
      concat content_tag :span, text
    end
  end
end
