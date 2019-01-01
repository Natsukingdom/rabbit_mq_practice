# frozen_string_literal: true

require 'bunny'

conn = Bunny.new
conn.start

channel = conn.create_channel
q = channel.queue('hello')

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'
  q.subscribe(block: true) do |_delivery_info, _properties, body|
    puts " [x] Received #{body} "
  end
rescue Interrupt => _
  conn.close
  exit(0)
end
