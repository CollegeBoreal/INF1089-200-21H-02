# How to send automatic emails notifications using Ansible

**A - Introduction**

Ansible used as automation engine in DevOps whcih helps you in configuration management, deployments,etc...It is an open source configuration management Deployment and Orchestration tool. It aims to provide large productivity gains to a wide variety of automation challenges.
Ansible comes with 20 plus modules and more than 3000 functionnalities bunded. 



Writing shell programs(also known as scripts) is one of the best strategy for gaining time. Once I write a shell program, I can go back at it as many times as needed. I can also update my shell scripts in between releases, installing new software, changing what I want or need to accomplish with the script. I can also easely add new functions, removing obsolete functions, and fixing bugs. These kinds of changes are just part of the maintenance cycle for any type of code.

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/ans1.PNG" width="250">

**What is Ansible Playbooks?**

Ansible Playbooks are the access points to Ansible provisionning. Written in YAML, playbooks provide a way to deploy and configure remote servers on various environments. On a higher level, these playbooks are used to handle multu-tier rollouts and load balancing taks for the servers.
So Ansible and Playbooks are very simple, they are used in many applications.
Example of a Playbook:

```
---
- hosts: webservers
  vars:
    http_port: 80
    max_clients: 200
    remote_user: root
    tasks:
    - name: ensure pache is at the latest version
      yum: name=httpd state=latest
    - name:write the apache config file
      template: src=/srv/httpd.j2 dest=/etc/httpd.cong
      notify:
      
     - restart apache
    - name: ensure apache is running (and enable it at
   boot)
      service: name=httpd state=started enable=yes
     handlers:
      - name:restart apache
        service:name=httpd state=restarted
 
``` 
   
**B - Installing Ansible on the server:**  

Indeed, to set up servers identically can be difficult, so Ansible will help to aumotize scripts sent to for example web servers and Database servers. Ww write one script as showm above and it will be used for every server.
Ansible is set to be a **push out configuration. It follows push out instructions** to speed up the process.  
What is push out instructions? A master server where we put instructions will then be pushing out configuration (the scripts) to other remote servers (and update them regularly). It could be a local machine or a server used to push out instructiosn to the nodes.

To install Ansible:

```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible

```

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/inst1.png" width="650">

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/inst2.png" width="650">

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/insta3.png" width="750">




In Ansible, we have modules (made of Playbooks as described above) and inventory. The imventory is management of the nodes we have in our environment. The local machine can then connects to the node through an SSH client.

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/mod.PNG" width="550">




<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/INS2.png" width="850">
<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/inst3.png" width="650">

We can see in the image below that the configuration files for Ansible are there (the configuration items for the system). We will need to change the files on ansible.cfg because those are written on default mode.
```
sudo vi ansible.cfg
```
The host file is a key part so I will change it to : inventory = hosts


<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/con1.PNG" width="850">

New configuration:  

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/con2.PNG" width="850">

Besides the ansible,cfg file, you have the hosts file, empty right now but it will need to have the servers used (webservers or database servers).

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/host1.PNG" width="850">

**C - Going deeper into Ansible:**

- We have the possibility to ping all your nodes once the servers are available. As an expample here, I pinged the local host to see the kind of result we"re having.
  To ping, use the formula below:
  
  
  ```
  ansible -m ping all
  ```
  
<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/ping1.PNG" width="850">

- For network interface configuration of the servers, you can use the following command:
```
ansible -m shell -a 'ifconfig' all
```
<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/ip1.PNG" width="850">





**D - How to send emails via Ansible using Playbooks:**

No one likes repetitive tasks. With Ansible, IT admins can begin to give up automatic tasks and let Ansible do it. Automation frees admins up to focus on efforts that help deliver more value to the business by speeding time to application delivery. 

Ansible is a simple automation language that can perfectly describe an IT application infrastructure. It’s easy-to-learn, self-documenting, and doesn’t require a grad-level computer science degree to read. 
Playbokk, as mentionned, is a list of configuration items needed to be installed to the servers (webservers or database servers).

1. Creating a Playbook file:

In this example, we will call it install.yml
```
vi install.yml
```
As shown in the example in the introduction, the Playbook will have this kind of information:

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/play1.PNG" width="850">

2. Writing a new Playbook:
We need to add all the inforamtion for the Playbooks and particularly the tasks needed:
Here the example in my case:

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/playbook.PNG" width="650">

3. Run and execute the Playbook:
```
ansible-playbook mysansible.yml
```

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/send.png" width="650">

4. Success:
If you run the playbook and everything is OK, then you can check the emails to see if you received it:

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/fine.PNG" width="650">
<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/email.PNG" width="650">


**E - References: Details of the emails notifications body:**

1. SMTP Connection    
host: The address of the mail server. Default is localhost.  
port: The port number of the mail server to connect. Mostly 25, 465, 587.  
username: If SMTP requires a username.  
password: If SMTP requires a password.  
timeout: Sets the timeout in seconds for connection attempts.  

2. Connection Security
secure = always.   Sends email only if connection is encrypted. It fails if the server doesn't accept the encrypted connection.  
secure = never.    Before sending an email, the connection doesn't attempt to set up a secure SSL/TLS session.   
secure = try.      Before trying to send an email, the connection attempts to set up a secure SSL/TLS session.  
secure = starttls. Before sending an email, the connection tries to upgrade to a secure SSL/TLS connection. The connection fails in case if unable to do so.  

3. Email Headers
headers : A list of headers that needs to go with the message.  
from    : The email address from which the mail is sent. Default is root.  
to      : The email address(es) of the recipient to whom the mail sent.  
cc      : The email address(es) of the recipient to whom the mail copied.  
bcc     : The email address(es) of the recipient to whom the mail 'blind' copied.  

4. Subject  
subject : The subject of the email to send (mandatory).  
subtype : The minor mime type, can be either plain or HTML. The major type is always text.  

5. Email Body  
charset : The character set of the email to send. Default is UTF-8  
body    : The body of the email to send.  
attach  : A list of files (full path) to attach to the mail. The content-type should be set to "application/octet-stream" for all the attached files.  


**F - Playbook examples with using Gmail SMTP**

**Sending a mail using SMTP (Mandrill, Mailjet, SendGrid etc…)**
```
   name: Send a success email  
   mail:  
   host: smtp.mandrillapp.com    
   port: 587   
   username: 28283aeebd83616c6  
   password: 0432eb4224e406  
   to: Zackito Toronto <zackito@gmail.com>  
   subject: Installation Update  
   body: 'The installation is complete.'  
  ``` 
   
 **Sending a mail with an attachment**
   You can attach multiple files by leaving a space between them. The files must exist on the controller (the machine which the ansible task is executed).

```
   name: Send the latest report  
  mail:  
   host: smtp.mandrillapp.com  
   port: 587   
   username: 28283aeebd83616c6  
   password: 0432eb4224e406  
   to: Zackito Toronto <zackito@gmail.com>  
   subject: Installation Update  
   body: 'Attached is the report of the changes that is live'  
   attach: /var/www/reports/latest.csv  
```   
   
**Reading contents of a file and including in the email.**
   Sometimes, you may want to include the content of a file in the message body.
   You would need to read the content of the file, using the “lookup” command and include it in the message body. The file needs to be on the
```
   mail:  
    name: Sending contents of a file in the email body  
   mail:  
    host: smtp.mandrillapp.com  
    port: 587   
    username: 28283aeebd83616c6  
    password: 0432eb4224e406  
    to: Zackito Toronto <zackito@gmail.com>  
    subject: Change log  
    body: "{{ lookup('file', '/var/www/release.txt') }}"  
```
