puts "======== Add cape option: VERILOG_TEMPLATE ========"

#-------------------------------------------------------------------------------
# Import HDL source files
#-------------------------------------------------------------------------------
import_files -hdl_source "$cape_dir/HDL/apb_ctrl_status.v"
import_files -hdl_source "$cape_dir/HDL/P8_IOPADS.v"
import_files -hdl_source "$cape_dir/HDL/P9_11_18_IOPADS.v"
import_files -hdl_source "$cape_dir/HDL/P9_21_31_IOPADS.v"
import_files -hdl_source "$cape_dir/HDL/P9_41_42_IOPADS.v"
import_files -hdl_source "$cape_dir/HDL/CAPE.v"

build_design_hierarchy

create_hdl_core -file $project_dir/hdl/CAPE.v -module {CAPE} -library {work} -package {}

hdl_core_add_bif -hdl_core_name {CAPE} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {BIF_1} -signal_map {}
hdl_core_assign_bif_signal -hdl_core_name {CAPE} -bif_name {BIF_1} -bif_signal_name {PADDR} -core_signal_name {APB_SLAVE_SLAVE_PADDR}
hdl_core_assign_bif_signal -hdl_core_name {CAPE} -bif_name {BIF_1} -bif_signal_name {PSELx} -core_signal_name {APB_SLAVE_SLAVE_PSEL}
hdl_core_assign_bif_signal -hdl_core_name {CAPE} -bif_name {BIF_1} -bif_signal_name {PENABLE} -core_signal_name {APB_SLAVE_SLAVE_PENABLE}
hdl_core_assign_bif_signal -hdl_core_name {CAPE} -bif_name {BIF_1} -bif_signal_name {PWRITE} -core_signal_name {APB_SLAVE_SLAVE_PWRITE}
hdl_core_assign_bif_signal -hdl_core_name {CAPE} -bif_name {BIF_1} -bif_signal_name {PRDATA} -core_signal_name {APB_SLAVE_SLAVE_PRDATA}
hdl_core_assign_bif_signal -hdl_core_name {CAPE} -bif_name {BIF_1} -bif_signal_name {PWDATA} -core_signal_name {APB_SLAVE_SLAVE_PWDATA}
hdl_core_rename_bif -hdl_core_name {CAPE} -current_bif_name {BIF_1} -new_bif_name {APB_TARGET}

#-------------------------------------------------------------------------------
# Build the Cape module
#-------------------------------------------------------------------------------
set sd_name ${top_level_name}

#-------------------------------------------------------------------------------
# Cape pins
#-------------------------------------------------------------------------------
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_11} -port_direction {IN}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_13} -port_direction {OUT}

# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_12} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_14} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_15} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_16} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_17} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_18} -port_direction {OUT}

# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_21} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_22} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_23} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_24} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_25} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_26} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_27} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_28} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_29} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_30} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_31} -port_direction {OUT}

# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_41} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_42} -port_direction {OUT}


# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_3} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_4} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_5} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_6} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_7} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_8} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_9} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_10} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_11} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_12} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_13} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_14} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_15} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_16} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_17} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_18} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_19} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_20} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_21} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_22} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_23} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_24} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_25} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_26} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_27} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_28} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_29} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_30} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_31} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_32} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_33} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_34} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_35} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_36} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_37} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_38} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_39} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_40} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_41} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_42} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_43} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_44} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_45} -port_direction {OUT}
# sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_46} -port_direction {OUT}

#-------------------------------------------------------------------------------
# Instantiate.
#-------------------------------------------------------------------------------

sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {CAPE} -instance_name {CAPE}

#-------------------------------------------------------------------------------
# Connections.
#-------------------------------------------------------------------------------

# Clocks and resets
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_PCLK" "CAPE:PCLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_FABRIC_RESET_N" "CAPE:PRESETN" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:GPIO_2_F2M" "CAPE:GPIO_IN"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:GPIO_2_M2F" "CAPE:GPIO_OUT"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F" "CAPE:GPIO_OE"}

sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_3} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_4} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_5} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_6} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_7} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_8} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_9} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_10} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_11} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_12} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_13} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_14} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_15} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_16} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_17} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_18} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_19} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_20} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_21} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_22} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_23} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_24} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_25} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_26} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_27} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_28} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_29} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_30} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_31} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_32} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_33} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_34} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_35} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_36} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_37} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_38} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_39} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_40} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_41} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_42} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_43} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_44} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_45} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_46} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_11} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_12} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_13} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_14} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_15} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_16} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_17} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_18} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_21} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_22} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_23} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_24} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_25} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_26} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_27} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_28} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_29} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_30} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_31} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_41} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_42} -port_name {}


sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:APB_TARGET" "BVF_RISCV_SUBSYSTEM:CAPE_APB_MTARGET"}

sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_A}
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_B}
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_C}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_A" "CAPE:INT_A"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_B" "CAPE:INT_B"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_C" "CAPE:INT_C"}


#-------------------------------------------------------------------------------
# Unused pins
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MMUART_4_TXD}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MMUART_4_RXD} -value {GND}

# Connect the unused cape pins to GND
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_12} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_14} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_15} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_16} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_17} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_18} -value {GND}

# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_21} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_22} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_23} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_24} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_25} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_26} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_27} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_28} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_29} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_30} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_31} -value {GND}

# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_41} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_42} -value {GND}


# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_3} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_4} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_5} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_6} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_7} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_8} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_9} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_10} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_11} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_12} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_13} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_14} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_15} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_16} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_17} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_18} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_19} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_20} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_21} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_22} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_23} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_24} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_25} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_26} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_27} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_28} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_29} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_30} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_31} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_32} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_33} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_34} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_35} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_36} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_37} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_38} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_39} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_40} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_41} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_42} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_43} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_44} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_45} -value {GND}
# sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P8_46} -value {GND}
