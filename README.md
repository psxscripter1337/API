# docs
# TO INVOKE/FIRE REMOTES:
## Networking.Invoke & Networking.Fire
eg:
Networking.Fire("Update Hoverboard State", true") 

# functions

## TeleportToBank()
Teleports script executioner to the bank

## TeleportToMailbox()
Teleports script executioner to the mailbox

## NewOption(Message)
Creates a new option with the message specified, eg:

NewOption("Continue?")

![image](https://user-images.githubusercontent.com/124915791/235674421-d8e95fa9-240a-4c72-ab4d-88e3f79fb0fa.png)

returns the option as getgenv().Option

## NewMessage(Message)
Creates a new message with the message specified, eg:

NewMessage("Welcome to 443 hub")

![image](https://user-images.githubusercontent.com/124915791/235674915-370cb537-ad2c-41e8-8cf0-1fb990bd5663.png)

## AreaTeleport(Area)
Teleports script executioner to the specified area, eg: AreaTeleport("Shop")

## GetHoverboards()
Gets all hoverboards and returns them as a table called Hoverboards
