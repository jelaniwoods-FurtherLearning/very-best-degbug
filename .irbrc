require 'rubygems'
require 'active_support/all'
require 'pry'

Pry.start 
#history 
IRB.conf[:PROMPT_MODE] = :SIMPLE
# irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path(ENV["THEIA_WORKSPACE_ROOT"] + "/.irb-save-history")
puts File::expand_path(ENV["THEIA_WORKSPACE_ROOT"] + "/.irb-save-history")

exit
