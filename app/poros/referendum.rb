class Referendum
  attr_reader :type, :title, :url

  def initialize(data)
    @type = data[:type]
    @title = data[:referendumTitle]
    @url = data[:referendumUrl]
  end
end
