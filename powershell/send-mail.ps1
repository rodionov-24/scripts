Get-Service | where {$_.Name -eq 'TeamViewer'} | % {
if ($_.Status -eq 'Stopped') {

    #E-mail settings
$SMTPServer = "mail.andersenlab.com"
$SMTPPort = "587"
$Username = "r.radzivonau@andersenlab.com"
$Password = "heynze123map145/"
$to = "rrodionov1108@gmail.com"
$subject = "Service TeamViewer is not running"

    #message
$message = New-Object System.Net.Mail.MailMessage
$message.subject = $subject
$message.body = "!!!!!!!!WARNING!!!!!!!Service Teamviewer is not running"
$message.to.add($to)
$message.from = $username

    #Send E-mail
$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)

    }
}

