gds readonly true
tech sky130A

# Load LEF và DEF
lef read MBIST_Controller.lef
def read MBIST_Controller.def

load MBIST_Controller

# Flatten tất cả cell để chuẩn bị export
select top cell
flatten

# DRC fix (nếu cần)
drc style drc(full)
drc check

# Xuất GDS
gds write MBIST_Controller.gds

exit

