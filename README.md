# Ridoy.Net Firmware

Personal Padavan-based firmware customization for the **TP-Link TL-WR840N V6**.

## Hardware target

- Board profile: \`TL_WR840N-V6\`
- Intended device: TP-Link TL-WR840N EU V6.20 (4 MB flash; verify the printed hardware revision and flash size on the actual router before installation)
- SoC: MediaTek MT7628
- Wi-Fi: 2.4 GHz
- Config template: \`trunk/configs/templates/tplink/tl_wr840n-v6.config\`

## Ridoy.Net captive portal

The custom source branch includes:

- HTTP captive interception for unapproved client MAC addresses.
- DHCP Option 114 advertisement for compatible captive-portal clients (RFC 8910).
- An RFC 8908 captive-portal API endpoint at \`/captive-api.json\`.
- A Ridoy.Net portal page at \`/portal.html\`.
- A device approval queue with name, phone, IP address and MAC address.
- An authenticated router-admin page at \`/RidoyPortal.asp\`.
- An approval plan labelled **Unlimited GB**. Approved MAC addresses remain allowed until an administrator removes them from the stored allow-list.
- IPv4 and IPv6 forwarding gates; DNS remains available to support captive checks.
- Shortcut Forward Engine disabled in the WR840N V6 template so firewall policy remains in the traffic path.

### Administration

1. Connect to the router and sign in to the router's normal administrator interface.
2. Open \`http://<router-LAN-IP>/RidoyPortal.asp\` (for example, \`http://192.168.1.1/RidoyPortal.asp\`).
3. Review the pending client's name, phone, IP and MAC.
4. Select **Approve · Unlimited GB** or **Deny**.

The approval list is stored in router storage at \`/etc/storage/ridoy_portal_allow\`; pending requests are stored at \`/etc/storage/ridoy_portal_pending\`.

### Compatibility notes

- DHCP Option 114 is intended for phones and operating systems that support RFC 8910 / RFC 8908. Other clients rely on their normal HTTP captive-network checks.
- The portal redirects plain HTTP traffic. HTTPS cannot be transparently redirected without breaking TLS, so clients should use their operating system's captive-network sign-in prompt or open a plain-HTTP page.
- The Unlimited GB label means the device remains authorised until removed. It does not implement a metered data cap, monthly quota or per-device GB counter.
- Device identity is based on the MAC address visible to the router. A device using a different/private MAC after approval will need separate approval.
- This branch is a development build until GitHub Actions reports a successful build and the resulting image is checked.

## Build

Open the **Actions** tab and run **Ridoy.Net Padavan Build - TL-WR840N V6**, or push a change to \`main\`. The workflow checks the V6 board profile and 4 MB flash layout, builds the MIPS toolchain and firmware, validates the output image size, and publishes a checksummed artifact.

## Safety

A successful compilation does not prove a safe installation. Do not flash until the image format, board ID, flash layout and exact hardware revision have been independently verified. Keep a known-good backup and recovery method. This firmware is not automatically flashed to the router.

## Licensing

This project is based on GPL-licensed firmware sources. Preserve the upstream copyright, license and third-party notices when distributing source or firmware. Ridoy.Net branding does not replace upstream attribution.
