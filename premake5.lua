project "ImGui"
    kind "StaticLib"
    language "C"
    cppdialect "C++20"

    targetdir ("Binaries/" .. outputdir)
    objdir("Intermediate/" .. outputdir)

    files
    {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_widgets.cpp",
        "imgui_tables.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp"
    }

    includedirs
    {
        ".",
        "%{IncludeDir.GLFW}"
    }

    -- Platform Windows
    filter "system:windows"
        systemversion "latest"
        files
        {
            "backends/imgui_impl_glfw.h",
            "backends/imgui_impl_glfw.cpp",
            "backends/imgui_impl_opengl3.h",
            "backends/imgui_impl_opengl3.cpp",
            "backends/imgui_impl_opengl3_loader.h"
        }

    -- Config Debug
    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    -- Config Release
    filter "configurations:Release"
        runtime "Release"
        optimize "On"