
#!/usr/bin/python

import random 

chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*"

while 1:
	print(" ")
	password_len = int(input('How long would you like your password to be : '))
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
