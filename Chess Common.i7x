Version 1/210803 of Chess Common by Andrew Schultz begins here.

"Functions common to Fourbyfouria and Fivebyfivia."

volume common big picture stuff

chapter common includes

include Old School Verb Total Carnage by Andrew Schultz.

include Trivial Niceties by Andrew Schultz.

include Intro Restore Skip by Andrew Schultz.

include Undo Output Control by Erik Temple.

chapter variables

to say email: say "blurglecruncheon@gmail.com"

to say 12b: say "Twelvebytwelvia"

to say 12n: say "[12b]n"

to say 5b: say "Fivebyfivia"

to say 5n: say "[5b]n"

to say 4b: say "Fourbyfouria"

to say 4n: say "[4b]n"

to say verbs: say "[b]V[r] or [b]VERB[r] or [b]VERBS[r]"

screen-reader is a truth state that varies.

in-beta is a truth state that varies.

debug-state is a truth state that varies.

chapter common rules

The print final score rule is not listed in the for printing the player's obituary rulebook.

volume i6 modification(s)

section What Do You Want to X

Include (-
Replace LanguageVerb;
-) after "Definitions.i6t".

Include (-
[ LanguageVerb i;
	switch (i) {
	'i//','inv','inventory': print "take inventory";
	'l//':   print "look";
	'x//':   print "examine";
	'z//':   print "wait";
	'about':  print "see info about the game";
	'credit', 'credits': print "see the credits";
	'c//', 'p//', 'call', 'place': print "(P)lace or (C)all";
	default: rfalse;
	}
	rtrue;
];
-) after "Language.i6t".

section G mapped from "again"

Include (-

#Undef AGAIN2__WD;
Constant AGAIN2__WD = 'again';

-) after "Language.i6t".

volume room stuff

chapter room properties

a room has text called room-edge-text.

a room has a number called xval.

a room has a number called yval.

a room can be puzzly. a room is usually puzzly.

a room can be guarded. a room is usually not guarded.

to reset-guard: now all rooms are not guarded.

chapter all the rooms

offsite is a not puzzly room. xval of offsite is -3. yval of offsite is -3. [ this is where we dump unused stuff ]

a1 is a room. xval of a1 is 0. yval of a1 is 0.

b1 is a room. xval of b1 is 1. yval of b1 is 0.

c1 is a room. xval of c1 is 2. yval of c1 is 0.

d1 is a room. xval of d1 is 3. yval of d1 is 0.

e1 is a room. xval of e1 is 4. yval of e1 is 0.

a2 is a room. xval of a2 is 0. yval of a2 is 1.

b2 is a room. xval of b2 is 1. yval of b2 is 1.

c2 is a room. xval of c2 is 2. yval of c2 is 1.

d2 is a room. xval of d2 is 3. yval of d2 is 1.

e2 is a room. xval of e2 is 4. yval of e2 is 1.

a3 is a room. xval of a3 is 0. yval of a3 is 2.

b3 is a room. xval of b3 is 1. yval of b3 is 2.

c3 is a room. xval of c3 is 2. yval of c3 is 2.

d3 is a room. xval of d3 is 3. yval of d3 is 2.

e3 is a room. xval of e3 is 4. yval of e3 is 2.

a4 is a room. xval of a4 is 0. yval of a4 is 3.

b4 is a room. xval of b4 is 1. yval of b4 is 3.

c4 is a room. xval of c4 is 2. yval of c4 is 3.

d4 is a room. xval of d4 is 3. yval of d4 is 3.

e4 is a room. xval of e4 is 4. yval of e4 is 3.

a5 is a room. xval of a5 is 0. yval of a5 is 4.

b5 is a room. xval of b5 is 1. yval of b5 is 4.

c5 is a room. xval of c5 is 2. yval of c5 is 4.

d5 is a room. xval of d5 is 3. yval of d5 is 4.

e5 is a room. xval of e5 is 4. yval of e5 is 4.

chapter defining room traits

to decide which number is edge-count of (r - a room):
	let temp be 0;
	if xval of r is 4 or yval of r is 4, increment temp;
	if xval of r is 0 or yval of r is 0, increment temp;
	decide on temp;

definition: a room (called r) is edgy:
	if edge-count of r > 0, yes;
	no;

definition: a room (called r) is cornery:
	if edge-count of r is 2, yes;
	no;

to decide which room is room-from-nums of (n1 - a number) and (n2 - a number):
	repeat with Q running through rooms:
		if xval of Q is n1 and yval of Q is n2:
			decide on Q;
	if debug-state is true:
		say "(DEBUG) Could not find room for [n1] and [n2].";
	decide on offsite;

definition: a room (called r) is otherly:
	if r is location of player, no;
	if r is puzzly, yes;
	no;

volume direction definitions

a direction has a number called yness. yness of a direction is usually 0.

a direction has a number called xness. xness of a direction is usually 0.

xness of northwest is -1. yness of northwest is 1.

xness of northeast is 1. yness of northeast is 1.

xness of southwest is -1. yness of southwest is -1.

xness of southeast is 1. yness of southeast is -1.

xness of east is 1. yness of east is 0.

xness of west is -1. yness of west is 0.

xness of north is 0. yness of north is 1.

xness of south is 0. yness of south is -1.

chapter direction traits

definition: a direction (called d) is viable:
	if the room d from the location of player is nowhere, no;
	if the room d from the location of player is offsite, no;
	yes;

volume object properties

a piece is a kind of person. a piece can be reserved, irrelevant or placed. a piece is usually irrelevant.

a thing can be examined. a thing is usually not examined.

volume arithmetic

to decide which number is absval of (n - a number):
	if n > 0, decide on n;
	decide on 0 - n;

volume verb stuff

section no rhetorical questions

understand the command "y" as something new.
understand the command "yes" as something new.
understand the command "no" as something new. [these are to reject the "That was a rhetorical question" error, which can annoy players. ]

section standard verb renaming

check pushing: say "You're not some boring old woodpusher who sits crouched over a board for hours on end. Besides, your allies can push themselves well enough. They're motivated enough." instead;

check pulling: say "You already pulled [the noun] away." instead;

chapter calling

calling is an action applying to one visible thing.

understand the command "call" as something new.
understand the command "c" as something new.
understand the command "place" as something new.
understand the command "p" as something new.

understand "call [any thing]" as calling.
understand "c [any thing]" as calling.
understand "place [any thing]" as calling.
understand "p [any thing]" as calling.

understand "call" as calling.
understand "c" as calling.
understand "place" as calling.
understand "p" as calling.

chapter gotoing

gotoing is an action applying to one visible thing.

understand the command "g" as something new.
understand the command "gt" as something new.
understand the command "go to" as something new.

understand "g [any puzzly room]" as gotoing.
understand "gt [any puzzly room]" as gotoing.
understand "go to [any puzzly room]" as gotoing.

this is the already-here rule:
	if noun is location of player, say "You're already here." instead;

volume meta verb stuff

chapter abbing

[this means different things in 4 or 5, but I might as well wrap all the similar code up here]

abbing is an action out of world.

understand the command "abbrev" as something new.
understand the command "abb" as something new.
understand the command "ab" as something new.

understand "abbrev" as abbing.
understand "abb" as abbing.
understand "ab" as abbing.


chapter abouting

abouting is an action out of world.

understand the command "about" as something new.
understand the command "a" as something new.

understand "about" as abouting.
understand "a" as abouting.

chapter boarding

boarding is an action applying to nothing.

understand the command "board" as something new.
understand the command "b" as something new.
understand the command "map" as something new.
understand the command "m" as something new.

understand "board" as boarding.
understand "b" as boarding.
understand "map" as boarding.
understand "m" as boarding.

chapter chessing

chessing is an action out of world.

understand the command "chess" as something new.
understand the command "ch" as something new.

understand "chess" as chessing.
understand "ch" as chessing.

chapter creditsing

creditsing is an action out of world.

understand the command "credits" as something new.
understand the command "credit" as something new.
understand the command "cr" as something new.

understand "credits" as creditsing.
understand "credit" as creditsing.
understand "cr" as creditsing.

chapter failing

failing is an action out of world.

understand the command "fail" as something new.
understand the command "f" as something new.

understand "fail" as failing.
understand "f" as failing.

chapter helping

helping is an action out of world.

understand the command "help" as something new.
understand the command "hint" as something new.
understand the command "h" as something new.

understand "hint" as helping.
understand "help" as helping.
understand "h" as helping.

chapter toggleing

toggleing is an action out of world.

understand the command "toggle" as something new.
understand the command "t" as something new.

understand "toggle" as toggleing.
understand "t" as toggleing.

chapter verbsing

verbsing is an action out of world.

understand the command "verbs" as something new.
understand the command "verb" as something new.
understand the command "v" as something new.

understand "verbs" as verbsing.
understand "verb" as verbsing.
understand "v" as verbsing.

volume parser syntax and errors

the check for room names rule is listed first in the for printing a parser error rulebook.

rule for printing a parser error (this is the check for room names rule):
	if the player's command matches the regular expression "\b<a-z><0-9>+\b", case insensitively:
		if the player's command matches the regular expression "\b<a-e><1-5>\b", case insensitively:
			say "If you want to go to another square, just type it in, e.g. [random otherly room]. You can't do anything else with a room.";
		else:
			say "It looks like you are referring to a square not on the board. Only a1-e5 are available. You can type any square name to move to it.[paragraph break]For general help, type [verbs].";
		the rule succeeds;
	continue the action;

rule for printing a parser error when the latest parser error is the noun did not make sense in that context error:
	say "The verb was okay, but I didn't understand the noun in that sentence. You can type [verbs] to see how to use verbs with a subject."

rule for printing a parser error when the latest parser error is the only understood as far as error:
	say "You only needed the first word of that command. You can use the up arrow and backspace so you don't have to retype."

rule for printing a parser error when the latest parser error is the didn't understand error or the latest parser error is the not a verb I recognise error:
	say "That wasn't a verb I recognized. You may wish to type [verbs] to see the list of pared-down verbs in this game."

chapter kludge to avoid "sense in that context" error

after reading a command:
	if the player's command matches the regular expression "^<a-e><1-5>$", case insensitively:
		let n be indexed text;
		now n is "gt [the player's command]";
		change the text of the player's command to n;

Chess Common ends here.

---- DOCUMENTATION ----
