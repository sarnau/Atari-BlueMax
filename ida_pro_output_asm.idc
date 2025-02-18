#include <idc.idc>

static main()
{
  auto file = get_idb_path()[0:-4] + ".asm";
  auto fhandle = fopen(file, "w");
  gen_file(OFILE_ASM, fhandle, 0, BADADDR, GENFLG_ASMTYPE);

  file = get_idb_path()[0:-4] + ".lst";
  fhandle = fopen(file, "w");
  gen_file(OFILE_LST, fhandle, 0, BADADDR, GENFLG_ASMTYPE);

  qexit(0); // exit to OS, error code 0 - success
}
