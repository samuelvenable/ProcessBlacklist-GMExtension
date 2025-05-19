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
  // run this function on and off - not every
  // step - because it's a bit resource heavy
  BlacklistProcIdByVersionInfo(pKey_FileDescription,"Cheat Engine");
  // process id of zero means it wasn't found
  if (GetBlacklistedProcessId() != 0) {
    // kill cheat engine's process if the version info matches it
    if (GetVersionInfoFromExecutablePathName(
      ExeFromProcId(GetBlacklistedProcessId()), 
      pKey_FileDescription) == "Cheat Engine") {
      ProcIdKill(GetBlacklistedProcessId());
	  // set found process id back to zero
	  FreeBlacklistedProcessId();
    }
    // kill the game
    show_error("You Cheater!", true);
  }
  alarm[0] = 100;
}