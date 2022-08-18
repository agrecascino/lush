
if charset == "Unicode" then
if stringmode == "WCHAR" then
  project "OpenMPT"
	uuid "37FC32A4-8DDC-4A9C-A30C-62989DD8ACE9"
else
  project "OpenMPT-UTF8"
	uuid "e89507fa-a251-457e-9957-f6b453c77daf"
end
else
	project "OpenMPT-ANSI"
	uuid "ba66db50-e2f0-4c9e-b650-0cca6c66e1c1"
end
  language "C++"
  vpaths { ["*"] = "../../" }
  mpt_kind "GUI"
if stringmode == "UTF8" then
   targetname "OpenMPT-UTF8"
elseif charset == "MBCS" then
   targetname "OpenMPT-ANSI"
else
   targetname "OpenMPT"
end
  filter {}
  local extincludedirs = {
   "../../include",
   "../../include/ancient/api",
   "../../include/asiomodern/include",
   "../../include/ASIOSDK2/common",
   "../../include/flac/include",
   "../../include/lame/include",
   "../../include/lhasa/lib/public",
   "../../include/mpg123/ports/MSVC++",
   "../../include/mpg123/src/libmpg123",
   "../../include/nlohmann-json/include",
   "../../include/ogg/include",
   "../../include/opus/include",
   "../../include/opusenc/include",
   "../../include/opusfile/include",
   "../../include/portaudio/include",
   "../../include/rtaudio",
   "../../include/vorbis/include",
   "../../include/zlib",
  }
	filter { "action:vs*" }
		includedirs ( extincludedirs )
	filter { "not action:vs*" }
		externalincludedirs ( extincludedirs )
	filter {}
  includedirs {
   "../../src",
   "../../common",
   "../../soundlib",
   "$(IntDir)/svn_version",
   "../../build/svn_version",
  }
	files {
		"../../mptrack/res/OpenMPT.manifest",
	}
	if _OPTIONS["windows-version"] ~= "winxp" then
		files {
			"../../include/asiomodern/include/ASIOModern/*.hpp",
		}
	end
  files {
   "../../src/mpt/**.cpp",
   "../../src/mpt/**.hpp",
   "../../src/openmpt/**.cpp",
   "../../src/openmpt/**.hpp",
   "../../common/*.cpp",
   "../../common/*.h",
   "../../soundlib/*.cpp",
   "../../soundlib/*.h",
   "../../soundlib/plugins/*.cpp",
   "../../soundlib/plugins/*.h",
   "../../soundlib/plugins/dmo/*.cpp",
   "../../soundlib/plugins/dmo/*.h",
   "../../sounddsp/*.cpp",
   "../../sounddsp/*.h",
   "../../unarchiver/*.cpp",
   "../../unarchiver/*.h",
   "../../misc/*.cpp",
   "../../misc/*.h",
   "../../tracklib/*.cpp",
   "../../tracklib/*.h",
   "../../mptrack/*.cpp",
   "../../mptrack/*.h",
   "../../mptrack/plugins/*.cpp",
   "../../mptrack/plugins/*.h",
   "../../test/*.cpp",
   "../../test/*.h",
   "../../pluginBridge/BridgeCommon.h",
   "../../pluginBridge/BridgeWrapper.cpp",
   "../../pluginBridge/BridgeWrapper.h",
  }
  files {
   "../../mptrack/mptrack.rc",
   "../../mptrack/res/*.*", -- resource data files
  }

	defines { "MPT_BUILD_ENABLE_PCH" }
	pchsource "../../build/pch/PCH.cpp"
	pchheader "PCH.h"
	files {
		"../../build/pch/PCH.cpp",
		"../../build/pch/PCH.h"
	}
	includedirs {
		"../../build/pch"
	}
	forceincludes {
		"PCH.h"
	}

  defines { "MODPLUG_TRACKER", "MPT_BUILD_DEFAULT_DEPENDENCIES" }
  dpiawareness "None"
  largeaddressaware ( true )
  characterset(charset)
if charset == "Unicode" then
else
	defines { "NO_WARN_MBCS_MFC_DEPRECATION" }
	defines { "MPT_CHECK_WINDOWS_IGNORE_WARNING_NO_UNICODE" }
end
if stringmode == "UTF8" then
	defines { "MPT_USTRING_MODE_UTF8_FORCE" }
end
  flags { "MFC" }
	-- work-around https://developercommunity.visualstudio.com/t/link-errors-when-building-mfc-application-with-cla/1617786
	if _OPTIONS["clang"] then
		filter {}
		filter { "configurations:Debug" }
			if true then -- _AFX_NO_MFC_CONTROLS_IN_DIALOGS
				ignoredefaultlibraries { "afxnmcdd.lib" }
				links { "afxnmcdd.lib" }
			end
			if charset == "Unicode" then
				ignoredefaultlibraries { "uafxcwd.lib", "libcmtd.lib" }
				links { "uafxcwd.lib", "libcmtd.lib" }
			else
				ignoredefaultlibraries { "nafxcwd.lib", "libcmtd.lib" }
				links { "nafxcwd.lib", "libcmtd.lib" }
			end
		filter { "configurations:DebugShared" }
			if charset == "Unicode" then
				ignoredefaultlibraries { "mfc140ud.lib", "msvcrtd.lib" }
				links { "mfc140ud.lib", "msvcrtd.lib" }
			else
				ignoredefaultlibraries { "mfc140d.lib", "msvcrtd.lib" }
				links { "mfc140d.lib", "msvcrtd.lib" }
			end
		filter { "configurations:Checked" }
			if true then -- _AFX_NO_MFC_CONTROLS_IN_DIALOGS
				ignoredefaultlibraries { "afxnmcd.lib" }
				links { "afxnmcd.lib" }
			end
			if charset == "Unicode" then
				ignoredefaultlibraries { "uafxcw.lib", "libcmt.lib" }
				links { "uafxcw.lib", "libcmt.lib" }
			else
				ignoredefaultlibraries { "nafxcw.lib", "libcmt.lib" }
				links { "nafxcw.lib", "libcmt.lib" }
			end
		filter { "configurations:CheckedShared" }
			if charset == "Unicode" then
				ignoredefaultlibraries { "mfc140u.lib", "msvcrt.lib" }
				links { "mfc140u.lib", "msvcrt.lib" }
			else
				ignoredefaultlibraries { "mfc140.lib", "msvcrt.lib" }
				links { "mfc140.lib", "msvcrt.lib" }
			end
		filter { "configurations:Release" }
			if true then -- _AFX_NO_MFC_CONTROLS_IN_DIALOGS
				ignoredefaultlibraries { "afxnmcd.lib" }
				links { "afxnmcd.lib" }
			end
			if charset == "Unicode" then
				ignoredefaultlibraries { "uafxcw.lib", "libcmt.lib" }
				links { "uafxcw.lib", "libcmt.lib" }
			else
				ignoredefaultlibraries { "nafxcw.lib", "libcmt.lib" }
				links { "nafxcw.lib", "libcmt.lib" }
			end
		filter { "configurations:ReleaseShared" }
			if charset == "Unicode" then
				ignoredefaultlibraries { "mfc140u.lib", "msvcrt.lib" }
				links { "mfc140u.lib", "msvcrt.lib" }
			else
				ignoredefaultlibraries { "mfc140.lib", "msvcrt.lib" }
				links { "mfc140.lib", "msvcrt.lib" }
			end
		filter {}
	end
  warnings "Extra"
  links {
   "ancient",
   "UnRAR",
   "zlib",
   "minizip",
   "smbPitchShift",
   "lame",
   "lhasa",
   "flac",
   "mpg123",
   "ogg",
   "opus",
   "opusenc",
   "opusfile",
   "portaudio",
   "r8brain",
   "rtaudio",
   "rtmidi",
   "soundtouch",
   "vorbis",
  }
  filter {}
	if _OPTIONS["windows-version"] ~= "winxp" then
  linkoptions {
   "/DELAYLOAD:mf.dll",
   "/DELAYLOAD:mfplat.dll",
   "/DELAYLOAD:mfreadwrite.dll",
--   "/DELAYLOAD:mfuuid.dll", -- static library
   "/DELAYLOAD:propsys.dll",
  }
	end
  filter { "action:vs*" }
    files {
      "../../build/vs/debug/openmpt.natvis",
    }
  filter {}
  prebuildcommands { "..\\..\\build\\svn_version\\update_svn_version_vs_premake.cmd $(IntDir)" }
