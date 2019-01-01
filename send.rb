# frozen_string_literal: true

require 'bunny'

# 接続の確立
connection = Bunny.new
connection.start

# チャンネルの作成
channel = connection.create_channel

# 送るべきキューの定義
queue = channel.queue('hello')

channel.default_exchange.publish('Hello World!', routing_key: queue.name)
puts " [x] Sent 'Hello World!' "

connection.close
