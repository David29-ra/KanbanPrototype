class Card
  attr_reader :title, :members, :labels, :checklist, :due_date, :id

  @id_sequence = 0

  def initialize(title:, due_date: nil, id: nil, **collections)
    @id = id || self.class.next_id
    self.class.sequence = @id
    @title = title
    @members = collections[:members] || []
    @labels = collections[:labels] || []
    @checklist = collections[:checklist] || []
    @due_date = due_date
  end

  def to_json(*_args)
    { id: @id, title: @title, members: @members, labels: @labels, checklist: @checklist, due_date: @due_date }.to_json
  end

  def self.sequence=(id)
    @id_sequence = id
  end

  def self.next_id
    @id_sequence += 1
  end
end
