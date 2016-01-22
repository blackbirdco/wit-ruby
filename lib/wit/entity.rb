class EntityCollection < OpenStruct
  def [](name)
    send(name.to_sym)
  end
end
