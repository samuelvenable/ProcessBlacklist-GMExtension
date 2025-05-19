// blacklisted processes run by admin: this 
// game needs to be run as admin to find it
RunSelfAsAdmin();
// run this function on and off - not every
// step - because it's a bit resource heavy
BlacklistProcIdByVersionInfo(pKey_FileDescription,"Cheat Engine");
// process id of zero means it wasn't found
if (GetBlacklistedProcessId() != 0) {
  // kill Cheat Engine's process if the version info matches it
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
for (var n = 0; n < 4; n++) {
  key[n] = "";
}