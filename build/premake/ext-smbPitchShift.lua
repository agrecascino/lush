
 project "smbPitchShift"
  uuid "89AF16DD-32CC-4A7E-B219-5F117D761F9F"
  language "C++"
  location ( "%{wks.location}" .. "/ext" )
  mpt_kind "default"
  targetname "openmpt-smbpitchshift"
  includedirs { }
	filter {}
	filter { "action:vs*" }
		characterset "Unicode"
	filter {}
  files {
   "../../include/smbPitchShift/smbPitchShift.cpp",
  }
  files {
   "../../include/smbPitchShift/smbPitchShift.h",
  }
  filter { "action:vs*" }
    buildoptions { "/wd4244" }
  filter {}
  filter { "kind:SharedLib" }
   defines { "SMBPITCHSHIFT_BUILD_DLL" }
  filter {}
