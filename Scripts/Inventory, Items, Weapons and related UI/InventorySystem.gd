extends Control
var weapon_slot

#GrabReferenceTo UI BOX
var none_ui_box
var bronze_ui_box
var silver_ui_box
var gold_ui_box 
var diamond_ui_box

#GrabReference
var bronze_bow_icon
var silver_bow_icon
var gold_bow_icon
var diamond_bow_icon
var bronze_spear_icon
var silver_spear_icon
var gold_spear_icon
var diamond_spear_icon
var bronze_staff_icon
var silver_staff_icon
var gold_staff_icon
var diamond_staff_icon

func _ready():
	#UI BOX
	none_ui_box = $"CenterContainer (WeaponBox)/TextureRect(NoWeapon)"
	bronze_ui_box = $"CenterContainer (WeaponBox)/TextureRect(Bronze)"
	silver_ui_box = $"CenterContainer (WeaponBox)/TextureRect(Silver)"
	gold_ui_box = $"CenterContainer (WeaponBox)/TextureRect(Gold)"
	#icons
	bronze_bow_icon = $"CenterContainer (WeaponIcon)/TextureRect(BronzeBow)"
	silver_bow_icon = $"CenterContainer (WeaponIcon)/TextureRect(SilverBow)"
	gold_bow_icon = $"CenterContainer (WeaponIcon)/TextureRect(GoldBow)"
	diamond_bow_icon = $"CenterContainer (WeaponIcon)/TextureRect(DiamondBow)"
	bronze_spear_icon = $"CenterContainer (WeaponIcon)/TextureRect(BronzeSpear)"
	silver_spear_icon = $"CenterContainer (WeaponIcon)/TextureRect(SilverSpear)"
	gold_spear_icon = $"CenterContainer (WeaponIcon)/TextureRect(GoldSpear)"
	diamond_spear_icon = $"CenterContainer (WeaponIcon)/TextureRect(DiamondSpear)"
	bronze_staff_icon = $"CenterContainer (WeaponIcon)/TextureRect(BronzeStaff)"
	silver_staff_icon = $"CenterContainer (WeaponIcon)/TextureRect(SilverStaff)"
	gold_staff_icon = $"CenterContainer (WeaponIcon)/TextureRect(GoldStaff)"
	diamond_staff_icon = $"CenterContainer (WeaponIcon)/TextureRect(DiamondStaff)"


func update_weapon_icon(Weapon_Data, is_bronze, is_silver, is_gold, is_diamond, is_bow, is_spear, is_staff):
	
	none_ui_box.visible = not (Weapon_Data.is_bronze or Weapon_Data.is_silver or Weapon_Data.is_gold or Weapon_Data.is_diamond) 
	bronze_ui_box.visible = Weapon_Data.is_bronze
	silver_ui_box.visible = Weapon_Data.is_silver
	gold_ui_box.visible = Weapon_Data.is_gold
	diamond_ui_box.visible = Weapon_Data.is_diamond
