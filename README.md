# BeagleV-Fire Gateware & HSS Base

This is a modified version of the [BeagleV-Fire Gateware project](https://git.beagleboard.org/beaglev-fire/gateware), made to make it easier to describe the custom parts of a design separately from the core elements. Additional conveniences for building gateware (like automatic FPExpress programming) are also included. Bitstreams/device trees for Linux are have been omitted for simplicity.

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

Now, run `build-gateware`, pointing at a cape directory. There are some example capes in the `gateware-examples` directory. Copy these to your project and modify as needed.

## Capes
The custom parts of a gateware design are contained in a "Cape" directory (even though they don't necessarily have to relate to a Beagle board cape). Capes are expected to have the following directory structure:

```
<cape_dir>/
    OPTIONS
    ADD_CAPE.tcl
    constraints/cape.pdc
```

The `OPTIONS` file is used to configure the cape.
Valid options are:
- `M2`: `NONE`, `DEFAULT`, `PCIE_ONLY`
- `SYZYGY`: `NONE`, `DEFAULT`
- `MIPI_CSI`: `NONE`, `DEFAULT`

You can also add your own options by adding directories to `FPGA-design/script_support/components/{M2,SYZYGY,MIPI_CSI}`.

The `ADD_CAPE.tcl` file is used to add the cape to the gateware design.

The `constraints/cape.pdc` file is used to add the cape constraints to the gateware design.
