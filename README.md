# BeagleV-Fire Gateware & HSS Base

## Usage
Clone this repository, with submodules:
```sh
$ git clone --recursive
```

Configure HSS if desired. A default configuration is provided in the `hss.default-config` file, which will be used if no configuration is performed.
```sh
$ cd hart-software-services
$ make BOARD=mpfs-beaglev-fire config
```

Install [Libero](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/fpga/libero-software-later-versions) and [SoftConsole](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/soc-fpga/softconsole), and make sure the `PATH`, `LM_LICENSE_FILE`, and `FPGENPROG` environment variables are set.
```sh
export SC_INSTALL_DIR=/c/Microchip/SoftConsole-v2022.2-RISC-V-747
export LIBERO_INSTALL_DIR=/c/Microchip/Libero_SoC_v2024.1

export LM_LICENSE_FILE=/c/Microchip/flexlm/License.dat
export FPGENPROG=$LIBERO_INSTALL_DIR/Designer/bin64/fpgenprog.exe
export PATH=$PATH:$LIBERO_INSTALL_DIR/Designer/bin:$LIBERO_INSTALL_DIR/Designer/bin64:$SC_INSTALL_DIR/riscv-unknown-elf-gcc/bin:$LIBERO_INSTALL_DIR/SynplifyPro/bin
```

Add the `bin` directory to your PATH.

