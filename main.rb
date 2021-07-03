require_relative "clin_boards"
store = ARGV.shift

app = ClinBoards.new(store.nil? ? "store.json" : store)
app.start
