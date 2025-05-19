#!/bin/bash

set -e

usage() {
    echo "Usage: $0 GATEWARE-DIR [options]"
    echo "Options:"
    echo "  -f, --force-hss           Force the build of the HSS"
    echo "  -p, --program             Program the FPGA/bootloader after building"
    echo "  -b, --bitstream-only      Generate bitstream only, skip Libero project generation"
    echo "  -c, --create-only         Only create the Libero design, skip the build"
    echo "  -s, --synthesize-only     Only synthesize the design, skip the build"
    echo "  --program-only            Program the device only, skip the build"
}

# Default values
FORCE_HSS=0
PROGRAM=0
BITSTREAM_ONLY=0
CREATE_ONLY=0
SYNTHESIZE_ONLY=0
PROGRAM_ONLY=0

# Parse arguments
POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--force-hss)
            FORCE_HSS=1
            shift
            ;;
        -p|--program)
            PROGRAM=1
            shift
            ;;
        -b|--bitstream-only)
            BITSTREAM_ONLY=1
            shift
            ;;
        -c|--create-only)
            CREATE_ONLY=1
            shift
            ;;
        -s|--synthesize-only)
            SYNTHESIZE_ONLY=1
            shift
            ;;
        --program-only)
            PROGRAM_ONLY=1
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        -*|--*)
            echo "Unknown option $1"
            usage
            exit 1
            ;;
        *)
            POSITIONAL_ARGS+=("$1")
            shift
            ;;
    esac
done

# Restore positional arguments
set -- "${POSITIONAL_ARGS[@]}"

# Check for required GATEWARE-DIR argument
if [ $# -ne 1 ]; then
    usage
    exit 1
fi

GATEWARE_DIR=$(pwd)/"$1"

if [ ! -d "$GATEWARE_DIR" ]; then
    echo "Error: GATEWARE-DIR does not exist"
    exit 1
fi

set -x

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cd $SCRIPT_DIR

# Create build directory
mkdir -p "$GATEWARE_DIR/build"

# Now you can use these variables in your script:
# $FORCE_HSS
# $PROGRAM
# $BITSTREAM_ONLY
# $CREATE_ONLY
# $SYNTHESIZE_ONLY
# $PROGRAM_ONLY
# $GATEWARE_DIR

