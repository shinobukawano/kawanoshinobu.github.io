class Jekyll::Page

  def relative
    depth = dir.split("/").length-1
    if depth < 0 then
      ""
    else
      "../" * depth
    end
  end

  def to_liquid(attrs = ATTRIBUTES_FOR_LIQUID)
    super(attrs + %w[
          relative
    ])

  end
end

class Jekyll::Post

  def relative
    depth = dir.split("/").length
    if depth < 0 then
      ""
    else
      "../" * depth
    end
  end

  def to_liquid(attrs = ATTRIBUTES_FOR_LIQUID)
    super(attrs + %w[
          relative
    ])

  end
end
