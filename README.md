# Compulab IOT-GATE-IMX8PLUS

This is the base Nerves System configuration for the
[Compulab IOT-GATE-IMX8PLUS](https://www.compulab.com/products/iot-gateways/iot-gate-imx8plus-industrial-arm-iot-gateway).

![IOT-GATE](assets/images/iot-gate.jpg)
<br><sup>[Image credit](#compulab)</sup>

| Feature        | Description                                                 |
| -------------- | ----------------------------------------------------------- |
| CPU            | 1.8 GHz quad-core Cortex-A53 (64-bit)                       |
| NPU            | AI/ML Neural Processing Unit, up to 2.3 TOPS                |
| MCU            | ARM Cortex-M7, 800Mhz                                       |
| Storage        | eMMC                                                        |
| Linux kernel   | 6.6                                                         |
| IEx terminal   | UART `ttymxc1`                                              |
| GPIO, I2C, SPI | Yes - [Elixir Circuits](https://github.com/elixir-circuits) |
| Display        | Yes                                                         |
| Ethernet       | Yes - ETH2 port is recognized as `eth0`                     |
| WiFi           | Yes                                                         |
| Bluetooth      | Yes                                                         |
| RTC            | Yes                                                         |
| HW Watchdog    | Yes                                                         |

[Image credit](#compulab): This image is from
[compulab.com](https://www.compulab.com/products/iot-gateways/iot-gate-imx8plus-industrial-arm-iot-gateway).

## Getting started

The IOT-GATE-IMX8PLUS gateway expects the bootloader to be located on hardware BOOT partition 1. When flashing firmware, ensure that both the bootloader and a complete disk image, generated using the fwup CLI tool, are provided.

### Wi-Fi

The IOT-GATE-IMX8PLUS can be ordered with an Intel Wi-Fi 6 AX210 / Bluetooth module. Wi-Fi can be enabled by loading the following kernel module.

```elixir
iex> cmd "modprobe iwlwifi"
```

### Building firmware

#### Prerequisites

- [NXP mfgtools](https://github.com/nxp-imx/mfgtools)
- [fwup](https://github.com/fwup-home/fwup)

#### Flashing a firmware image

The initial firmware image needs to be flashed to the IOT-GATE via the USB programming port (not console port). This involves passing the bootloader and disk image to `uuu`, which will flash the device.

Begin by connecting a USB cable from the provisioning computer to the device's programming port. Keep the device powered off.

Enter your Nerves application's project directory. Build your application firmware to produce the files for the next steps. Set `MIX_TARGET` with the target name for your system in your application's `mix.exs` file.

```
MIX_TARGET=gate mix firmware
```

The bootloader image `imx8-boot-sd.bin` is built by the Nerves system, and is located inside the Nerves artifact for this system. Replace or set `$VERSION` with your version of this Nerves system.

```
~/.nerves/artifacts/nerves_system_iot_gate_imx8plus-portable-$VERSION/images/imx8-boot-sd.bin
```

Convert the Nerves `.fw` firmware bundle into a raw disk image. Replace or set `$TARGET` with the target & environment names the firmware was built for (`gate_dev`).

```
fwup -a \
  -i _build/$TARGET/nerves/images/firmware.fw \
  -d _build/$TARGET/nerves/images/firmware.img \
  -t complete
```

Enter the following command, which will search for the device. Power on the device, which will be discovered and flashed by `uuu`.

```
uuu \
  -b emmc_all \
  ~/.nerves/artifacts/nerves_system_iot_gate_imx8plus-portable-$VERSION/images/imx8-boot-sd.bin \
  _build/$TARGET/nerves/images/firmware.img
```

When flashing is complete, power off the device and remove the cable from the programming port. Power on the device and it will boot into your Nerves firmware. Further updates can be performed with the standard Nerves OTA update functionality.
