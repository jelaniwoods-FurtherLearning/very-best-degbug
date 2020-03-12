require 'rubygems'
require 'active_support/all' 
require 'pry'
require 'irb/completion'
require 'irb/ext/save-history'
 Pry.start 
#history
IRB.conf[:PROMPT_MODE] = :SIMPLE # irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path(ENV['THEIA_WORKSPACE_ROOT'] + '/.irb-save-history')
 # Setup permanent history.
HISTFILE = ENV['THEIA_WORKSPACE_ROOT'] + '/.irb-save-history'
MAXHISTSIZE = 1000
begin
  histfile = File::expand_path(HISTFILE)
  if File::exists?(histfile)
    puts "File real"
    lines = IO::readlines(histfile).collect { |line| line.chomp }
    puts "Read #{lines.nitems} saved history commands from '#{histfile}'." if $VERBOSE
    Readline::HISTORY.push(*lines)
  else
    puts "History file '#{histfile}' was empty or non-existant." if $VERBOSE
  end
  Kernel::at_exit do
    # lines = Readline::HISTORY.to_a.reverse.uniq.reverse
    lines = Readline::HISTORY.to_a
    # puts lines
    # lines = lines[-MAXHISTSIZE, MAXHISTSIZE] if lines.nitems > MAXHISTSIZE
    puts "Saving #{lines.length} history lines to '#{histfile}'." 
    File::open(histfile, File::WRONLY|File::CREAT|File::TRUNC) { |io| io.puts lines.join("\n") }
  end
rescue => e
  puts "Error when configuring permanent history: #{e}" if $VERBOSE
end

# puts File::expand_path(ENV['THEIA_WORKSPACE_ROOT'] + '/.irb-save-history')
exit
