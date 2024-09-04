/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Basic Choices
 - Knot structure
 - Recurring choices
 - Conditionals in descriptions
 - Conditionals in choices
 
 In the assignment:
 - Add four more knots (and feel free to change any of the example text, this is YOUR story)
 - Add at least one more conditional
*/

-> lobby

== lobby ==

You are a cat. Your current human companion is eating breakfast at the hotel you are staying at. You have just finished a grand adventure with him and helped slain the dragon that was terrorizing the land, and now you are tired.
You lie under his feet, resting from a long month of travels. {not knockedover: His glass of water sits on the table.}

A man is talking to your companion, asking for his help on a new adventure. He wants him to leave immedietly. You do not want to go on another adventure.

*[Grab room key] ->key_pickup
+ [Go to your room] ->leave_lobby
+ [Run outside] ->outside_interlude
*[Knock over glass of water] -> knockedover


== leave_lobby ==
You leave the busy dining area to head back to your room.->hallway

==hallway==
This hallway outside your room is long and dark. Good thing you are a cat and can see in the dark. {not key_pickup: Unfortunantly you cannot pick locks.}
*[Try to scratch door open] -> damaged_door
*{key_pickup} [Use room key] ->room
+{room} [Go in room] ->room
+[Go back]->lobby
-> END

==roomfromoutside
You narrowly squeeze through the window. Good thing you're a cat.->room

==room==
{not clawed_clothes: You enter your room.  It is small; a window is left cracked open where the curtains flutter in the breeze, and the ceiling above creaks with heavy footsteps. There is a small attatched bathroom with the door slightly ajar.} 
Your companion's {clawed_clothes: shredded} things are strewn about the room in a haphazard fashion. You think of ways to "convince" him not to go on another adventure so soon.
+[Go in bathroom] ->bathroom
*[Claw up clothes] -> clawed_clothes
*[Pick up boots] ->picked_up_boots
+[Exit room] ->hallway
+[Go out window] ->backoutthewindow
->END

==bathroom==
The bathroom smells funky {boots_in_tub: and distinctly like wet leather}, and there is a small tub in the corner. {not boots_in_tub: You might have an idea.}
*[Turn water on] ->water_turned_on
*{picked_up_boots}{water_turned_on} [Put boots in tub] ->boots_in_tub
+[Go back to room] ->room
->END

==boots_in_tub==
Oh he won't like this. But at least he wouldnt be going anywhere for a while.
*[Continue]->bathroom

== water_turned_on ==
You turn the water on. The water starts flowing into the tub. Your companion won't want to travel in wet clothes, right?
->bathroom

==picked_up_boots==
You pick up his boots. They're a bit large and hard to carry, but made of a nice leather.
*[Continue] -> room

==clawed_clothes ==
You shred his clothes. This should keep him from leaving on this adventure. At least, until he can get new ones.
*[Continue] ->room

== damaged_door ==
You scratch at the door. It does not open. Hopefully the hotel staff isn't too mad at the damage.
+[Go Back]->hallway
->END

==key_pickup ==
You now have a key to your human conpanion's room. It's your room too. What's his is yours.
*[Continue] -> lobby
->END

==knockedover==
You leap up onto the table, scattering food everywhere and knocking your companion's full glass of water onto the other man. Your companion yells, but it is not as loud as the inquiring man's shout. 
He screams that he is allergic to cats, and no longer wants your companion's help. He storms away.
Well that was easy.
*[Continue]->aftermath

==aftermath==
Your companion glares at you, but continues eating his breakfast. He didn't want to work with a man allergic to cats anyway.
{clawed_clothes: You hope he doesn't find out about his clothes.{boots_in_tub: Or his boots.}}
{boots_in_tub: {not clawed_clothes: You hope he doesn't blame you for the boots}}
{damaged_door: He shouldn't get too mad at you about the door. After all, you are a cat.}
You curl back up under his feet.
->END

== outside_interlude ==
You dart out from under your companion's feet and run outside, narrowly avoiding the hotel staff. You hear the staff shut the door behind you. You cannot get back in that way. ->outside
->END

==outside==
It is bright outside in the early morning. The front door to the hotel is locked.
*[Wait for your companion.] -> waited
+[Walk around hotel] -> hotelback
->END

==hotelback==
You walk around to the back of the hotel. You can see your room's window left cracked on the second floor. You should be able to get in, if you want.
+[Climb up window] ->roomfromoutside
+[Go back] ->outside
->END

==backoutthewindow==
You jump out the window. You land on your feet, because there is no world in which you do not. 
+[Climb back up window] ->roomfromoutside
+[Go around hotel] ->outside
->END

==waited==
You find a spot of sun to lie in and slowly fall asleep.
Soon you wake to your companion and the inquierer walking out with their things, talking loudly.
{boots_in_tub: Your companion makes a loud sloshing noise as he walks up.}{clawed_clothes: Your human's clothes hang in tatters.} 
{boots_in_tub:{clawed_clothes:{damaged_door: He sees you. He frowns a little bit, and then stops walking. He stares right at you, and then down at his attire. He looks back up. "This man here is allergic to cats," he says. "You can stay here for this adventure." He then leaves with the man. }}}
{not boots_in_tub: {not clawed_clothes: {not damaged_door: He sees you. He grins a little bit, and then stops walking. "Hey, there you are," he says. }}}
{not boots_in_tub: {not clawed_clothes: {not damaged_door: The other man glares at you, and you glare back. He turns to your companion and loudly declares "I am allergic to cats!" Your companion is schocked by this declaration, and then informs the man that he will not be be helping him without you. The man huffs and storms away. }}}
*{boots_in_tub}{clawed_clothes}{damaged_door} [Continue]->alone
*{not boots_in_tub} {not clawed_clothes} {not damaged_door} [Get up]->happyending

*{not boots_in_tub} {clawed_clothes} {damaged_door} [Get up]->neutralending
*{not boots_in_tub} {not clawed_clothes} {damaged_door} [Get up]->neutralending
*{boots_in_tub} {not clawed_clothes} {not damaged_door} [Get up]->neutralending
*{boots_in_tub} {not clawed_clothes} {damaged_door} [Get up]->neutralending
*{not boots_in_tub} {clawed_clothes} {not damaged_door} [Get up]->neutralending
*{boots_in_tub} {clawed_clothes} {not damaged_door} [Get up]->neutralending


=neutralending
Your companion spots you. 
"So that's where you got off too. Come back inside. {boots_in_tub: I'll need to wait a bit for my shoes to dry before I go anywhere.}{boots_in_tub:{clawed_clothes: And,}} {clawed_clothes: I'll need to pick up some new clothes before heading off on a new adventure.} We won't be leaving the hotel for a little while yet. This man even said he was allergic to cats! I can't have him come with us!"
The man looks at you both, and then stalks off, grumbling.

You both go inside, content to rest until the next new adventure; hopefully sometime in the far future.
->END

==happyending==
Your companion takes you back inside the hotel room. You find a patch of sunlight on the ground and lie down once more.
There should be no more adventures for a while.
->END

==alone==
You have been left alone. You are not going on an adventure. This is what you wanted, right?
->END




