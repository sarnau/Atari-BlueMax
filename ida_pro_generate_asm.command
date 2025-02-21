cd "$(dirname "$0")"
/Applications/IDA\ Pro\ 7.6/ida.app/Contents/MacOS/ida -A -Sida_pro_output_asm.idc BlueMax.idb
./Generate_Labels.py
