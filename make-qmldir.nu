#!/usr/bin/env nu

# MUST be run with dms dir as cwd

let dirs = (ls **/* | where type == dir | get name) | append '.'

for d in $dirs {
    let qml_files = (glob $"($d)/*.qml")

    if (($qml_files | length) > 0) {
        let module_name = if $d == "." {
            "qs"
        } else {
            ($d | path split | str join ".")
        }

        let qmldir_path = ($d | path join "qmldir")

        mut content = if $d == "." { $"module ($module_name)\n\n" } else { $"module qs.($module_name)\n\n" }

        for f in $qml_files {
            let base = ($f | path basename)
            let type_name = ($base | str replace ".qml" "")
            $content = ($content + $"($type_name) 1.0 ($base)\n")
        }

        $content | save -f $qmldir_path
    }
}
