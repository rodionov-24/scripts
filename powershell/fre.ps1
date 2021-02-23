#E-mail settings
$SMTPServer = "email.farmin.by"
$SMTPPort = "587"
$Username = "robot@farmin.by"
$Password = "robotfarminat"
$to = "rp@farmin.by"
$subject = "Администрация Фармин! Внимание! Истекают сроки годности"
$body = "Срочно реализовать лекарственные средства  на которые истекают сроки годности в данном месяце."
$message = New-Object System.Net.Mail.MailMessage
$message.subject = $subject
$message.body = $body
$message.to.add($to)
$message.from = $username
$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)



 















