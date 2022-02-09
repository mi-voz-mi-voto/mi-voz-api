class Election
  attr_reader :type, :office, :candidates

  def initialize(data)
    @type = data[:type]
    @office = data[:office]
    @candidates = data[:candidates]
  end
end
