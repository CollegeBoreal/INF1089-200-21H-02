# :zap: How to configure our network using python scripts:zap: 
:star: in this project I will show you how to use python script to configure your router on a Stick and your vlans on your switch and put all interfaces on the right vlans. 


## :zap: This is our topology :zap:
:star: we will use one router and one switch with three vlans and each vlan will receive IP address directly from DHCP server configured on my router.
<img src=images/1.PNG  alt="alt text" width="650" height="500">


#  :pushpin: Configuration of Router:

## :one: Connecrting remotely using SSH: 
:star: Connecting to our router from distance usign this set of commands. SSH helps us to connect to our router with our username and password: 
```python
import getpass
import sys
import telnetlib
import time

Host="10.13.237.210"

user=raw_input(' Enter User name: ')
password=getpass.getpass()

tn = telnetlib.Telnet(Host)
tn.read_until(b'Username: ')
tn.write(user.encode('ascii') + b'\n')

if password:
    tn.read_until(b'Password: ')
    tn.write(password.encode('ascii')+b'\n')


```
## :ok_hand:
:pushpin: all it dose is exactly like connecting to our router using Putty like the next two photos: 

##
<img src=images/2.PNG  alt="alt text" width="550" height="400">

##

<img src=images/3.PNG  alt="alt text" width="550" height="400">


## :two: Enabling and configuring our interfaces:     

:star: So when it connects, it starts to execute this lines of commands, first of all we should turn on our main interface and then configure our virtual interfaces using
this set of commands.

```python

time.sleep(2)
tn.write(b'enable\n')
time.sleep(2)
tn.write(b'cisco\n')
time.sleep(2)
tn.write(b'config t\n')
time.sleep(2)
tn.write(b'interface g0/1\n')
time.sleep(2)
tn.write(b'no shutdown\n')
time.sleep(2)

tn.write(b'exit\n')

tn.write(b'interface g0/1.10\n')
time.sleep(2)
tn.write(b'encapsulation dot1Q 10\n')
time.sleep(2)
tn.write(b'ip address 192.168.10.254 255.255.255.0\n')
time.sleep(2)
tn.write(b'no shutdown\n')
time.sleep(2)
tn.write(b'exit\n')

tn.write(b'interface g0/1.20\n')
time.sleep(2)
tn.write(b'encapsulation dot1Q 20\n')
time.sleep(2)
tn.write(b'ip address 192.168.20.254 255.255.255.0\n')
time.sleep(2)
tn.write(b'no shutdown\n')
time.sleep(2)
tn.write(b'exit\n')

tn.write(b'interface g0/1.30\n')
time.sleep(2)
tn.write(b'encapsulation dot1Q 30\n')
time.sleep(2)
tn.write(b'ip address 192.168.30.254 255.255.255.0\n')
time.sleep(2)
tn.write(b'no shutdown\n')
time.sleep(2)
tn.write(b'exit\n')
```

##

## :three: Configuring DHCP server: 

:star: Les's receive our IP addresses automatically from our router in each vlan by using this lines of commands: 


##
```python

tn.write(b'ip dhcp pool Vlan10\n')
time.sleep(2)
tn.write(b'network 192.168.10.0 255.255.255.0\n')
time.sleep(2)
tn.write(b'default-router 192.168.10.254\n')
time.sleep(2)
tn.write(b'dns-server 8.8.8.8\n')
tn.write(b'exit\n')

tn.write(b'ip dhcp pool Vlan20\n')
time.sleep(2)
tn.write(b'network 192.168.20.0 255.255.255.0\n')
time.sleep(2)
tn.write(b'default-router 192.168.20.254\n')
time.sleep(2)
tn.write(b'dns-server 8.8.8.8\n')
tn.write(b'exit\n')

tn.write(b'ip dhcp pool Vlan30\n')
time.sleep(2)
tn.write(b'network 192.168.30.0 255.255.255.0\n')
time.sleep(2)
tn.write(b'default-router 192.168.30.254\n')
time.sleep(2)
tn.write(b'dns-server 8.8.8.8\n')
time.sleep(2)
tn.write(b'exit\n')
```

##

## :four: Printing the result of our automation when it's done:

:star: This set of commands helps us to finish the execution and to verify which configuration is done at the end of executing the scrip:

##
```python
tn.write(b'end\n')
tn.write(b'exit\n')
line=tn.read_all()
print (line)
``` 

##
:star: Let's execute the scrip on our computer:

```
python Router.py
```

##
<img src=images/4.PNG  alt="alt text" width="950" height="400">


##
:star: Let's verify our pools existance on our router:

```
show run
```
##
<img src=images/5.PNG  alt="alt text" width="550" height="400">

#  :pushpin: Configuration of Switch:

##

## 1️⃣: Creating trunk connection between the switch and router:

##
```python
tn.write(b'interface g0/0\n')
time.sleep(2)
tn.write(b'switchport trunk encapsulation dot1q\n')
time.sleep(2)
tn.write(b'switchport mode trunk\n')
time.sleep(2)
```

##

## :two: Creating Vlans using loop feature in Python:

##
:star: Herer we are creating Vlans using loop, it creates vlan 2 til vlan 10:

##
```python

for n in range(2,10):
    tn.write(b"no vlan " + str(n).encode('ascii') + b"\n")
    time.sleep(2)
    
```

##

## :three: Dedicating interface to vlan:

```python
time.sleep(2)
tn.write(b'interface fastEthernet 0/12\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 2\n')
time.sleep(2)

time.sleep(2)
tn.write(b'interface fastEthernet 0/13\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 3\n')
time.sleep(2)

time.sleep(2)
tn.write(b'interface fastEthernet 0/14\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 4\n')
time.sleep(2)

time.sleep(2)
tn.write(b'interface fastEthernet 0/15\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 5\n')
time.sleep(2)

```
## :four: Printing the result:
```python
tn.write(b'end\n')
tn.write(b'exit\n')
line=tn.read_all()
print (line)
```
##

:pushpin: First let's check our vlans on our switch:
:star: In the following image you can see that there are just default vlans

##

<img src=images/6.PNG  alt="alt text" width="650" height="600">

##

:pushpin: Let's run our python script to create our vlans and configure our vlan interfaces:

##

<img src=images/7.PNG  alt="alt text" width="850" height="600">

:star: You can see that first, it asks for username, then password, and as it matchs, it start configuring, 
and at the end it prints the result of configuration.


##
:star: Now we come back on the switch and redo ``show vlan `` to verify if they've been created or not :

##
<img src=images/8.PNG  alt="alt text" width="650" height="800">

