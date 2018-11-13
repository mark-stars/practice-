#!/usr/bin/env python

import pika

credentials = pika.PlainCredentials('guest', 'guest')
connection = pika.BlockingConnection(pika.ConnectionParameters(
                                     '10.0.0.113',
                                     5672,
                                     '/',
                                     credentials))

channel = connection.channel()
channel.queue_declare(queue='Hello_World')

channel.basic_publish(exchange='',
                      routing_key='Hello_World',
                      body='This is mquser-3!')

print(" [x] Sent 'Hello_World'")

connection.close()
