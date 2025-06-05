extends Node

var PlayerHealth = 100.0
var PlayerATK = 100.0
var PlayerDEF = 100.0
var PlayerDMG = 0

var BossHealth = 100.0
var BossATK = 100.0
var BossDEF = 100.0
var BossDMG = 0

func player_dmg_sent():
	PlayerDMG += PlayerDMG / BossDEF
	BossHealth -= PlayerDMG
