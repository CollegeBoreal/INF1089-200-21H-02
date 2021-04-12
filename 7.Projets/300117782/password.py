#!/usr/bin/python

import random 

chars = "*&^%$#@!0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

while 1:
	print(" ")
	password_len = int(input('What length would you like your password to be : '))
	print(" ")
	password_count = int(input('How many passwords would you like : '))
	print(" ")
	print ("  Here is your passwords : ")
	print (" ")


	for x in range (0, password_count):
		password = ""
		for x in range(0, password_len):

			password_char = random.choice(chars)
			password = password + password_char
		print (" ")
		print (" ", password)
		print (" ")
