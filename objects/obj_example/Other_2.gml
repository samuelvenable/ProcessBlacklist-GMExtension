pause = false; 
i = 0; 
if (!pause) {
  list = ProcListCreate();
  size = ProcessIdLength(list);
  i += 1; if (i > size - 1) i = 0;
  if (size) {
    if (i < size) {
      procId = ProcessId(list, i);
      info = ProcInfoFromProcIdEx(procId, KINFO_EXEP);
      exe = ExecutableImageFilePath(info);
	  key[0] = GetVersionInfoFromExecutablePathName(exe, pKey_FileDescription);
	  key[1] = GetVersionInfoFromExecutablePathName(exe, pKey_Software_ProductName);
	  key[2] = GetVersionInfoFromExecutablePathName(exe, pKey_OriginalFileName);
	  key[3] = GetVersionInfoFromExecutablePathName(exe, pKey_Company);
	  key[4] = GetVersionInfoFromExecutablePathName(exe, pKey_Copyright);
      FreeProcInfo(info);
    }
  }
  FreeProcList(list);
  alarm[0] = 100;
}
