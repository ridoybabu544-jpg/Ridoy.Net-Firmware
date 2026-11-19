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
<section class="note" aria-live="polite" style="margin-top:14px">
<strong>Live router bandwidth (br0)</strong>
<div style="display:flex;gap:24px;flex-wrap:wrap;margin-top:8px">
<span>Download: <strong id="ridoy-down">--</strong></span>
<span>Upload: <strong id="ridoy-up">--</strong></span>
</div>
<small id="ridoy-bandwidth-status">Updating every second…</small>
</section>
<table>
<thead><tr><th>Name</th><th>Phone</th><th>MAC address</th><th>IP address</th><th>Action</th></tr></thead>
<tbody>
<% ridoy_portal_pending(); %>
</tbody>
</table>
<p><a href="/index.asp">Back to router settings</a></p>
</main>

<script>
(function () {
  var previous = null;
  var previousAt = 0;
  function formatRate(value) {
    if (!isFinite(value) || value < 0) return '--';
    if (value >= 1048576) return (value / 1048576).toFixed(2) + ' MB/s';
    if (value >= 1024) return (value / 1024).toFixed(1) + ' KB/s';
    return value.toFixed(0) + ' B/s';
  }
  function refreshBandwidth() {
    fetch('/RidoyBandwidth.asp?_=' + Date.now(), {cache: 'no-store', credentials: 'same-origin'})
      .then(function (response) {
        if (!response.ok) throw new Error('HTTP ' + response.status);
        return response.json();
      })
      .then(function (data) {
        var now = Date.now();
        var current = {rx: Number(data.rx), tx: Number(data.tx)};
        if (!isFinite(current.rx) || !isFinite(current.tx)) throw new Error('Invalid counters');
        if (previous && now > previousAt) {
          var seconds = (now - previousAt) / 1000;
          var down = Math.max(0, current.tx - previous.tx) / seconds;
          var up = Math.max(0, current.rx - previous.rx) / seconds;
          document.getElementById('ridoy-down').textContent = formatRate(down);
          document.getElementById('ridoy-up').textContent = formatRate(up);
        }
        previous = current;
        previousAt = now;
        document.getElementById('ridoy-bandwidth-status').textContent = 'Live · refreshed every second · total LAN bridge traffic';
      })
      .catch(function () {
        document.getElementById('ridoy-bandwidth-status').textContent = 'Bandwidth data unavailable';
      });
  }
  refreshBandwidth();
  window.setInterval(refreshBandwidth, 1000);
})();
</script>

</body>
</html>
