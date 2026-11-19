<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<title>Ridoy.Net · Captive Portal</title>
<style>
body{font:15px/1.5 Arial,sans-serif;background:#f3f6fa;color:#182334;margin:0;padding:22px}
main{max-width:1100px;margin:20px auto;background:#fff;padding:24px;border-radius:14px;box-shadow:0 5px 24px #14243b12}
h1{margin:0 0 6px;color:#173b70}
p{color:#5e6b7c}
table{width:100%;border-collapse:collapse;margin-top:20px}
th,td{padding:12px 10px;border-bottom:1px solid #e5eaf0;text-align:left;vertical-align:middle}
th{background:#edf3fb}
code{white-space:nowrap}
button{padding:9px 12px;border:0;border-radius:7px;background:#e8edf4;color:#20324a;font-weight:700}
.btn-success{background:#187c4a;color:white}
.note{background:#eef5ff;padding:12px;border-radius:8px}
</style>
</head>
<body>
<main>
<h1>Ridoy.Net · Captive Portal</h1>
<p>Review devices waiting for internet access. Approval grants the selected device the <strong>Unlimited GB</strong> access plan until it is removed from the approved list.</p>
<div class="note">Only approve devices you recognise. The device is identified by its current Wi-Fi MAC address.</div>
<table>
<thead><tr><th>Name</th><th>Phone</th><th>MAC address</th><th>IP address</th><th>Action</th></tr></thead>
<tbody>
<% ridoy_portal_pending(); %>
</tbody>
</table>
<p><a href="/index.asp">Back to router settings</a></p>
</main>
</body>
</html>
