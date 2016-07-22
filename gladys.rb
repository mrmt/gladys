# -*- coding: utf-8 -*-
# ruby gladys.rb 12:00 1 2 3 4 5 6 7 8 9 10 15 30 1m 2m 3m 4m 5m 10m 15m 20m 30m 45m 1h 1h30m 2h

require 'time'
require 'timers'

def usage
  STDERR.puts "Usage: ruby gladys.rb end_time timing [timing..]"
  STDERR.puts "  example: ruby gladys.rb 12:00 1 2 3 5m 30m 1h"
  exit
end

if !end_time = ARGV.shift
  usage
end

@end_time = Time.at(Time.parse(end_time))
@timers = Timers::Group.new

def add(seconds, talk)
  if (duration = @end_time - seconds - Time.now) > 1
    puts "#{@end_time - seconds} #{talk}" 
    @timers.after(duration){
      system("say -v Kyoko '#{talk}'")
    }
  end
end

ARGV.each do |v|
  if md = v.match(/^(\d+)$/)
    s = md[1].to_i
    if s < 10
      add(s, "#{s}")
    else
      add(s, "あと#{s}秒です")
    end
  end
  if md = v.match(/^(\d+)m$/)
    add(md[1].to_i * 60, "あと#{md[1]}分です")
  end
  if md = v.match(/^(\d+)h$/)
    add(md[1].to_i * 3600, "あと、#{md[1]}時間です")
  end
  if md = v.match(/^(\d+)h(\d+)m$/)
    add(md[1].to_i * 3600 + md[2].to_i * 60, "あと、#{md[1]}時間#{md[2]}分です")
  end
end

add(0, "終了です! お疲れさまでした")

@timers.after(@end_time - Time.now + 1) { exit }

loop { @timers.wait }
