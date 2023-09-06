# Simple Email relay Using BASH

mail.txt
```
 HELO smtp.example.com
 MAIL FROM:<noreply@example.com>
 RCPT TO:<example@gmail.com>
 DATA
 From: [NoReploy] <noreply@example.com>
 To: <example@gmail.com>
 Date: Mon, 12 Apr 2023 14:21:26 -0400
 Subject: Test Message

 This is a test email...

 Jeremy


 .
 QUIT
```

```
cat "mail.txt" |while read L; do sleep "1"; echo "$L"; done | "nc" -C -v "smtp.example.com" "25"
```
