class Card
  attr_reader :title, :members, :labels, :checklist, :due_date, :id

  @id_sequence = 0

  def initialize(hash)
    @id = hash[:id] || self.class.next_id
    self.class.sequence = @id
    @title = hash[:title]
    @members = hash[:members]
    @labels = hash[:labels]
    @checklist = hash[:checklist]
    @due_date = hash[:due_date]
  end

  def self.sequence=(id)
    @id_sequence = id
  end

  def self.next_id
    @id_sequence += 1
  end
end
