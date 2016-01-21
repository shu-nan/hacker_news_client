class News
  attr_accessor :title, :url, :author, :points, :created_at_str

  def initialize title_, url_, author_, points_, created_at_str_
    self.title, self.url, self.author, self.points, self.created_at_str = title_, url_, author_, points_, created_at_str_
  end

  def created_at
    # e.g. "2016-01-20T19:27:47.000Z",
    if self.created_at_str.blank?
      nil
    else
      DateTime.strptime(self.created_at_str.sub(/\.000Z/,'+0000'),'%Y-%m-%dT%H:%M:%S%z')
    end
  end

  def created_at_f
    created_at.nil? ? '-' : created_at.strftime('%d/%m/%Y') # dd/mm/YYYY
  end

end
