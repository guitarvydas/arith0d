package project

import zd "0d/odin"
import "0d/odin/std"

main :: proc() {
    main_container_name, diagram_names := std.parse_command_line_args ()
    palette := std.initialize_component_palette (diagram_names, components_to_include_in_project)
    std.run_demo (&palette, main_container_name, diagram_names, start_function)
}

start_function :: proc (main_container : ^zd.Eh) {
    filename := zd.new_datum_string ("ex1.math")
    msg := zd.make_message("input", filename, zd.make_cause (main_container, nil) )
    main_container.handler(main_container, msg)
}


components_to_include_in_project :: proc (leaves: ^[dynamic]zd.Leaf_Template) {
    zd.append_leaf (leaves, std.string_constant ("Arithmetic"))
    zd.append_leaf (leaves, std.string_constant ("arith.ohm"))
    zd.append_leaf (leaves, std.string_constant ("arithcl.rwr"))
    zd.append_leaf (leaves, std.string_constant ("arithjs.rwr"))
    zd.append_leaf (leaves, std.string_constant ("arithpy.rwr"))
    zd.append_leaf (leaves, std.string_constant ("arithwasm.rwr"))
    zd.append_leaf (leaves, std.string_constant ("null.js"))
}



