import qbs
import qbs.File
import qbs.TextFile
import "qbs/imports/QbsUtl/qbsutl.js" as QbsUtl

Project {
    name: "Gdal (Project)"

    minimumQbsVersion: "1.15.0"
    qbsSearchPaths: ["qbs"]

//    readonly property var projectVersion: projectProbe.projectVersion
//    readonly property string projectGitRevision: projectProbe.projectGitRevision

//    Probe {
//        id: projectProbe
//        property var projectVersion;
//        property string projectGitRevision;

//        readonly property string projectBuildDirectory:  project.buildDirectory
//        readonly property string projectSourceDirectory: project.sourceDirectory

//        configure: {
//            projectVersion = QbsUtl.getVersions(projectSourceDirectory + "/VERSION");
//            projectGitRevision = QbsUtl.gitRevision(projectSourceDirectory);
//            //if (File.exists(projectBuildDirectory + "/package_build_info"))
//            //    File.remove(projectBuildDirectory + "/package_build_info")
//        }
//    }

    property var cppDefines: {
        var def = [
                    "HAVE_EXPAT",
                    "GDAL_COMPILATION",
                    "COMPILATION_ALLOWED",
                    "CHARLS_2_1"
//            "RELEASE_NAME=\"Bleeding Edge\"",
//            "VERSION=" + projectVersion[0],
//            "VERSION_MAJOR=" + projectVersion[1],
//            "VERSION_MINOR=" + projectVersion[2],
//            "VERSION_PATCH=" + projectVersion[3],
//            "GIT_REVISION=\"" + projectGitRevision + "\"",
//            "SYNCHRONIZER_ENABLED",
//            //"KDESU_PATH="
        ];

        if (qbs.buildVariant === "release")
            def.push("NDEBUG");

        return def;
    }

    property var cxxFlags: [
        "-ggdb3",
        //"-Winline",
        "-Wall",
        "-Wextra",
        //"-Wno-unused-parameter",
        //"-Wno-variadic-macros",
    ]
    property string cxxLanguageVersion: "c++14"

    references: [
        "gdal/gdal.qbs",
//        "src/aisexpert/aisexpert.qbs",
//        "src/commands/commands.qbs",
    ]

}

/** Пакеты **
libkf5config-dev
libkf5kdelibs4support-dev
libkf5kio-dev
libkf5parts-dev
libkf5xmlgui-dev
libkf5widgetsaddons-dev
libkf5i18n-dev
libkf5service-dev
libkf5completion-dev

*/
