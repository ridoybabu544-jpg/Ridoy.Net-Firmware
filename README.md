# Ridoy.Net Firmware

A personal firmware customization project for the **TP-Link TL-WR845N V4**.

## Hardware target

- Board: `TL_WR845N-V4`
- SoC: MediaTek MT7628
- Wi-Fi: 2.4 GHz
- Flash layout: `4Mmtk`
- Board configuration: `trunk/configs/templates/tplink/tl_wr845n-v4.config`

## Firmware base

This project currently builds from the public Padavan-derived source repository:

- Source: https://github.com/ridoybabu544-jpg/Ridoy.Net
- Upstream project: https://github.com/OpenPadavan/padavan

The source tree is checked out by the GitHub Actions workflow at build time. It has **not** yet been copied into this repository. The original source repository is kept unchanged.

## Build

1. Open the **Actions** tab.
2. Select **Ridoy.Net Firmware Build**.
3. Choose **Run workflow**.
4. Wait for the Ubuntu 22.04 build job to finish.
5. Download the `Ridoy-Net-TL-WR845N-V4` artifact if the run succeeds.

Workflow: [Build firmware](.github/workflows/build.yml)

## Customization status

- [x] Dedicated Ridoy.Net-Firmware repository
- [x] Automated build workflow scaffold
- [x] Verified TL-WR845N V4 board template exists in the source tree
- [ ] Copy or mirror the complete firmware source into this repository
- [ ] Apply and verify Ridoy.Net branding in firmware and web interface
- [ ] Run a successful build and inspect the generated image
- [ ] Verify image format, size and device compatibility before any flashing

## Safety

Do not flash an image unless its target board, flash layout, image header and checksum have been verified for the exact hardware revision. A successful compilation alone does not prove safe flashing.

## Licensing

This project is based on GPL-licensed firmware sources. Preserve the original license, copyright notices and third-party license notices when redistributing source or binaries. Personal branding does not replace upstream attribution.
