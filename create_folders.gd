@tool
extends EditorScript

const FOLDERS: Array[String] = [
	"res://scenes/core",
	"res://scenes/dev",
	"res://scenes/ui/screens",
	"res://scenes/ui/components",
	"res://scenes/ui/overlays",
	"res://scenes/battle",
	"res://scenes/maps",
	"res://scripts/autoload",
	"res://scripts/ui",
	"res://scripts/gameplay",
	"res://scripts/services",
	"res://scripts/data",
	"res://data/units",
	"res://data/citizens",
	"res://data/maps",
	"res://data/waves",
	"res://assets/ui",
	"res://assets/characters",
	"res://assets/tilesets",
	"res://assets/backgrounds",
	"res://assets/icons",
	"res://assets/fonts",
	"res://assets/audio",
	"res://assets/debug",
	"res://docs",
	"res://tests",
]


func _run() -> void:
	var failed: int = 0
	for path: String in FOLDERS:
		var err: Error = DirAccess.make_dir_recursive_absolute(path)
		if err == OK or err == ERR_ALREADY_EXISTS:
			print("OK    ", path)
		else:
			push_error("GAGAL %s (%s)" % [path, error_string(err)])
			failed += 1
	EditorInterface.get_resource_filesystem().scan()
	print("Selesai. Gagal: ", failed)
