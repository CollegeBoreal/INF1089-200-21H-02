# How to send automatic emails notifications using Ansible

**A - Introduction**


Writing shell programs(also known as scripts) is one of the best strategy for gaining time. Once I write a shell program, I can go back at it as many times as needed. I can also update my shell scripts in between releases, installing new software, changing what I want or need to accomplish with the script. I can also easely add new functions, removing obsolete functions, and fixing bugs. These kinds of changes are just part of the maintenance cycle for any type of code.

<img src="https://github.com/CollegeBoreal/INF1089-200-21H-02/blob/main/7.Projets/300115140/IMAGES/ans1.PNG" width="250">

Ansible used as automation engine in DevOps whcih helps you in configuration management, deployments,etc...
Ansible comes with 20 plus modules and more than 3000 functionnalities bunded. 

To install Ansible:

```
$ sudo yum install ansible

```

In Ansible, you cand send reports on any particular tasks ans share it with teams or shareholders. You can use Playbook for that.

**B - How to send emails via Ansible:**

 


**C - The different parameters to send emails with Ansible**

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


**D - Example with using Gmail SMTP**

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
