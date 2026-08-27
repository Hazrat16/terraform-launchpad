#!/usr/bin/env bash
set -euo pipefail

dnf update -y
dnf install -y nginx

cat > /usr/share/nginx/html/index.html <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>${project_name} | Terraform Demo</title>
  <style>
    :root { font-family: Inter, system-ui, sans-serif; color-scheme: dark; }
    body {
      margin: 0; min-height: 100vh; display: grid; place-items: center;
      background: radial-gradient(circle at top, #5b46d8 0%, #17142d 42%, #090812 100%);
    }
    main {
      width: min(760px, 86vw); padding: 48px; border-radius: 24px;
      background: rgba(255,255,255,.08); border: 1px solid rgba(255,255,255,.18);
      box-shadow: 0 30px 80px rgba(0,0,0,.35); backdrop-filter: blur(12px);
    }
    .eyebrow { letter-spacing: .14em; text-transform: uppercase; opacity: .7; }
    h1 { font-size: clamp(2.4rem, 7vw, 5rem); line-height: .95; margin: 18px 0; }
    p { font-size: 1.2rem; line-height: 1.7; opacity: .86; }
    code { padding: .2rem .45rem; border-radius: .4rem; background: rgba(0,0,0,.35); }
    .badge { display: inline-block; margin-top: 18px; padding: 10px 14px; border-radius: 999px;
      background: rgba(110,231,183,.16); border: 1px solid rgba(110,231,183,.4); }
  </style>
</head>
<body>
  <main>
    <div class="eyebrow">bongoDev Infrastructure Lab</div>
    <h1>Infrastructure became code.</h1>
    <p>
      Project <code>${project_name}</code> is running in the
      <strong>${environment}</strong> environment. The VPC, subnet, route,
      security group, EC2 instance, and this page were created by Terraform.
    </p>
    <div class="badge">Promise fulfilled ✓</div>
  </main>
</body>
</html>
HTML

systemctl enable nginx
systemctl restart nginx
