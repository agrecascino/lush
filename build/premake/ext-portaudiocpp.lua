  
 project "portaudiocpp"
  uuid "627cf18a-c8ca-451e-afd0-8679cadfda6b"
  language "C++"
  location ( "%{wks.location}" .. "/ext" )
  mpt_kind "static"
  targetname "openmpt-portaudiocpp"
  includedirs { "../../include/portaudio/include", "../../include/portaudio/bindings/cpp/include" }
	filter {}
	filter { "action:vs*" }
		characterset "Unicode"
	filter {}
  defines {
   "PAWIN_USE_WDMKS_DEVICE_INFO",
   "PA_WDMKS_NO_KSGUID_LIB",
   "PA_USE_ASIO=0",
   "PA_USE_DS=1",
   "PA_USE_WMME=1",
   "PA_USE_WASAPI=1",
   "PA_USE_WDMKS=1",
  }
  files {
   "../../include/portaudio/bindings/cpp/include/portaudiocpp/*.hxx",
  }
  files {
   "../../include/portaudio/bindings/cpp/source/portaudiocpp/*.cxx",
  }
  links { "portaudio" }
  filter { "configurations:Debug" }
   defines { "PA_ENABLE_DEBUG_OUTPUT" }
  filter { "configurations:DebugShared" }
   defines { "PA_ENABLE_DEBUG_OUTPUT" }
  filter { "configurations:DebugMDd" }
   defines { "PA_ENABLE_DEBUG_OUTPUT" }
  filter {}
