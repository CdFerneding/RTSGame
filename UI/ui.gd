extends CanvasLayer

@onready var WoodLabel = $Wood
@onready var CoinsLabel = $Coins
@onready var SelectedUnitsLabel = $SelectedUnits


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	WoodLabel.text = "Wood: " + str(Game.Wood)
	CoinsLabel.text = "Coins: " + str(Game.Coin)
	SelectedUnitsLabel.text = "Units Selected: " + str(Game.SelectedUnits)
