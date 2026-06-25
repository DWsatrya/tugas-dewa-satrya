extends Node
   
var live = 5   

func lose_life() -> void:
	live -= 1
	print("Health player: ", live)
	# Setiap kena spike, live berkurang 1 lalu ditampilkan di output
	
	if live <= 0:
		print("Anda mati!")
		get_tree().reload_current_scene()
		# Jika live sudah 0, tampilkan pesan mati lalu restart scene

func add_life() -> void:
	if live < 5:
		live += 1
		print("Health bertambah! Health sekarang: ", live)
		# Jika live belum penuh, tambah 1 lalu tampilkan di output
	else:
		print("Health sudah penuh!")
		# Jika sudah 5, tidak bisa bertambah lagi
