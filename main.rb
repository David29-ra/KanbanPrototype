require_relative "clin_boards"
require_relative "commons/helper/prompter"
store = ARGV.shift

def file_extension?(store)
  return puts("---You need to Enter an file valid---".red) unless store.nil? || (!store.nil? && store.match?("json"))

  true
end

return unless file_extension? store

app = ClinBoards.new(store.nil? ? "store.json" : store)
app.start
