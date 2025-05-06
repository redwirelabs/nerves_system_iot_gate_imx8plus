# Changelog

## v0.4.0

- Dependencies
  - [Buildroot 2025.02.1](https://lore.kernel.org/buildroot/60b8483c-b717-41ce-a406-bceb71c3a089@rnout.be/T/)
  - [Arm Trusted Firmware lf-6.6.23-2.0.0](https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-bsp/imx-atf/imx-atf_2.10.bb)
  - [OP-TEE OS lf-6.6.23-2.0.0](https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-security/optee/optee-os_4.2.0.imx.bb)
  - [Linux v6.6.23 #96ad4675347](https://github.com/compulab-yokneam/linux-compulab/tree/96ad4675347)
  - [U-Boot 2023.04 #74267db6002](https://github.com/compulab-yokneam/u-boot-compulab/tree/74267db6002)

## v0.3.0

- Security
  - [nerves_system_br v1.30.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.30.1) - Fixes [CVE-2025-32433](https://nvd.nist.gov/vuln/detail/CVE-2025-32433)

- Dependencies
  - [Erlang/OTP 27.3.3](https://erlang.org/download/OTP-27.3.3.README.md)
  - [Buildroot 2024.11.2](https://lore.kernel.org/buildroot/87v7t3nyls.fsf@dell.be.48ers.dk/T/)
    - This is a major Buildroot update.

## v0.2.0

Added support for trusted platform modules (TPM).

## v0.1.0

Preliminary release that boots Nerves. Peripherals have not been validated.

- Dependencies
  - [Erlang/OTP 27.0.1](https://erlang.org/download/OTP-27.0.1.README)
  - [Buildroot 2024.05.1](https://lore.kernel.org/buildroot/87ed7xfq78.fsf@dell.be.48ers.dk/T/)
