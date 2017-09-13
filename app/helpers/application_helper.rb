module ApplicationHelper

  def t_enum(model, attribute)
    I18n.t "activerecord.attributes.#{model.class.to_s.downcase}.#{attribute}.#{model[attribute]}"
  end

end
