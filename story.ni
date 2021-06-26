"Fivebyfivia Delenda Est" by Andrew Schultz

the story headline is "Flagrant Horsing Around".

the story description is "Less impossible than beating Stockfish".

volume basics and definitions

include Trivial Niceties by Andrew Schultz.

in-beta is a truth state that varies.

debug-state is a truth state that varies.

to say 12b: say "Twelvebytwelvia"

to say 5b: say "Fivebyfivia"

max-quests is a number that varies. max-quests is 4.

quest-index is a number that varies. quest-index is 1.

moves-this-quest is a number that varies. moves-this-quest is 0.

description of the player is "Spiffy and knightly indeed."

a thing can be examined. a thing is usually not examined.

after examining a thing (called th):
	now th is examined;
	continue the action;

got-rook-for-queen is a truth state that varies.

chapter rooms

a room can be circle-visited. a room is usually not circle-visited.

a room can be guarded. a room is usually not guarded.

to reset-guard: now all rooms are not guarded.

chapter start of play

when play begins:
	say "Peace treaties get old and boring and stuffy after a while, y'know? They don't exactly keep up with the times. History changes. Perhaps the wimps who got a CLEAR bargain from the peace treaty don't deserve it any more.[paragraph break]That's definitely the case with [5b]. They've had fun for long enough. Besides, [12b] was called Elshapium when the treaty was signed, and now annexing [5b] would just about make a nice new square tidy country, pleasing to look at on a map.[paragraph break]Besides, if [12b] doesn't annex [5b], some far less civilized nation will. It's for their own good. Especially since gold and precious metals were discovered.[paragraph break]Thankfully, the [12b] spy ministry has devised a cunning plan to make sure things go as well as they can for [5b]. And you, a knight with a crazy (and crazy fast) horse, are just the person to help execute it! The old [5b]n king will never suspect you.[paragraph break]A solemn minister hands you a scroll entitled [FIVEBYFIVIA DELENDA EST]. And you're off!";
	now right hand status line is "[entry quest-index of quest-quick-desc]";

chapter FIVEBYFIVIA DELENDA EST

FIVEBYFIVIA DELENDA EST is a thing. the player carries FIVEBYFIVIA DELENDA EST. description of DELENDA is "[DELENDA] contains the instructions for your current quest. Right now, it seems you need to [current-quest-text].[paragraph break]There are also some general notes about not calling the enemy king until your allies are all set, or he'll get suspicious.".

printed name of DELENDA is "[i]FIVEBYFIVIA DELENDA EST[r]".

understand "fde" as DELENDA.
understand "dfe" as DELENDA.
understand "est" as DELENDA.
understand "del" as DELENDA.
understand "scroll" as DELENDA.

after examining DELENDA for the first time:
	say "You may wish to shorten typing [delenda]'s long name to [b]FDE[r], [b]EST[r], or [b]DEL[r]. Or you can just type [b]X[r]. You're an ambitious knight, not some boring old scribe who shows off writing fancy words out. You have much more exciting ways to show off!"

to say current-quest-text:
	if quest-index is 4:
		say "trample around all twenty-five precincts of [5b] without repeating twice";
		continue the action;
	say "entrap the [age-of] king of [5b] with [the list of offensive pieces]"

to say age-of:
	say "[if quest-index is 1]old[else if quest-index is 2]middle-aged[else]young[end if]"

check dropping DELENDA:
	say "And let such a valuable document fall into the wrong hands? Certainly not!" instead;

instead of doing something with DELENDA:
	if the current action is examining, continue the action;
	say "You can really only examine [DELENDA].";

your horse is a backdrop. Your horse is everywhere. understand "steed" as horse. description is "It has a zigzag-patterned coat. Like it was tiled with checkmarks. There are few like it.[paragraph break]You don't really notice the zigzags when you move. It really bucks around. To see which ways it can move, type [b]DIRS[r]."

instead of doing something with your horse:
	if the current action is examining, continue the action;
	say "You can really only ride your horse in one of eight directions. To get a refresher on that, type [b]DIRS[r]."

chapter i6

section char nums

To say character number (N - a number): (- print (char) {N}; -)

section what did you mean to

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
	'c//', 'credit', 'credits': print "see the credits";
	'c//', 'p//', 'call', 'place': print "place";
	default: rfalse;
	}
	rtrue;
];
-) after "Language.i6t".

chapter room info

a room has a number called x. a room has a number called y.

a room has text called room-edge-text.

offsite is a room. x of offsite is -3. y of offsite is -3.

the description of a room is usually "[room-color]. You're [room-edge-text of the item described] of [5b][commentary].".

to say commentary:
	let n be number of normal-viable directions;

to say room-color:
	say "The ground is [if the remainder after dividing (x of location of player + y of location of player) by 2 is 0]light[else]dark[end if]er than normal here"

rule for printing the locale description:
	if quest-index is 4 and show-tour-view is true:
		show-visited;
		the rule succeeds;
	say "[room-detail].";
	continue the action;

to say room-detail:
	if quest-index is 4:
		if number of visit-viable directions is 0:
			say "Unfortunately, you can't go anywhere new, so you can just go [list of visit-nonviable directions] and try again";
		else if number of visit-nonviable directions is 0:
			say "Any direction of [list of visit-viable directions] leads somewhere new";
		else:
			say "While going [list of visit-viable directions] would lead somewhere new, going [list of visit-nonviable directions] would not";
		continue the action;
	if location of player is c3:
		say "From here, your horse can bolt in any of the eight crazy directions it likes to zoom off. Hooray, freedom! Well, for you, not for [5b]";
		continue the action;
	say "You can go [list of weird-viable directions][if number of placed pieces is 0 and quest-index < 4] to search for the best place to CALL your first allies[end if]";

definition: a direction (called d) is viable:
	if the room d of location of player is offsite, no;
	if the room d of location of player is nowhere, no;
	yes;

definition: a direction (called d) is weird-viable:
	if d is weird and d is viable, yes;
	no;

definition: a direction (called d) is visit-viable:
	if d is weird and the room d of location of player is not circle-visited, yes;
	no;

definition: a direction (called d) is visit-nonviable:
	if d is weird and the room d of location of player is circle-visited, yes;
	no;

definition: a direction (called d) is normal-viable:
	if d is normal and d is viable, yes;
	no;

section going nowhere

check going nowhere:
	say "Your trusty steed won't budge. You grumble for a bit, then realize [5b] has no [file of noun][square of noun] area. What a piffly country! They should've been taken over long before this. They should feel LUCKY a country as swell as [12b] is plotting to take them over.[paragraph break]Anyway. Another direction, perhaps." instead;

to say file of (d - a direction):
	let d2 be xness of d + x of location of player;
	if d2 < 0:
		say "[character number 123 + d2]";
	else:
		say "[character number 97 + d2]";

to decide which number is square of (d - a direction):
	decide on 1 + y of location of player + yness of d.

section timed-going

after printing the locale description when need-to-hurry is true:
	increment current-turns-after-placing;
	if debug-state is true, say "DEBUG turn count track: [current-turns-after-placing] of [max-turns-after-placing].";
	if current-turns-after-placing > max-turns-after-placing:
		if enemy king is placed:
			say "You hear a noise and look around. The enemy king, disgusted at having his time wasted without meeting anyone, retreats. Perhaps he suspects something. Perhaps he does not.";
		else:
			say "You hear familiar moans. Your summoned compatriot[if number of placed pieces > 1]s have[else] has[end if] grown impatient. The whole operation was based on stealth, which you did not have this time.";
		say "[line break]You did not succeed in your quest, and your king and queen will not be pleased ... unless we pretend this was just a practice run you planned in your head before the real thing. Yes, yes, let's do that. That's how it is.";
		fail-and-reset;
	continue the action;

after printing the locale description when quest-index is 1:
	increment moves-this-quest;
	if remainder after dividing moves-this-quest by 7 is 0:
		say "You're still looking around for the best square to [b]CALL[r] or [b]PLACE[r] allies. It's worth scouting around, but just so you know, more than one square works for the first piece, and even if you mess up, this quest will reset, and you can retry. It's worth experimenting.[paragraph break]Oh, and if you want to seriously plan things out, every other square is reachable in four moves from the center.";
	continue the action;

section circle-visited

after going to a circle-visited room:
	say "A groan goes up across the land. You've been here before. Your triumphant tour is cut short. [if number of circle-visited cornery rooms > 0]You seemed to get trapped in the corner squares[else if number of circle-visited rooms < 10]Perhaps a bit of planning might help you get more places[else]You wonder if starting from the end -- any end -- might help you find a path through. You note that since c3 is a light square, and you move from light to dark squares and back, you will have to end on a light square after 24 moves--maybe cutting down the possibilities by starting on a less accessible light square would help[end if].";
	now final-failed-yet is true;
	say "[line break]";
	reset-the-board;

chapter direction info

a direction can be normal or weird. a direction is usually normal. a direction has text called vh-abbrev.

a direction has a number called yness. yness of a direction is usually 0.

a direction has a number called xness. xness of a direction is usually 0.

southsoutheast is a direction. it is weird. vh-abbrev is "SSE". northnorthwest is a direction. it is weird. vh-abbrev is "NNW".

xness of southsoutheast is 1. yness of southsoutheast is -2. xness of northnorthwest is -1. yness of northnorthwest is 2.

the opposite of southsoutheast is northnorthwest. the opposite of northnorthwest is southsoutheast.

understand "sse" and "ses" and "ess" as southsoutheast.

understand "nnw" and "nwn" and "wnn" as northnorthwest.

southeasteast is a direction. it is weird. vh-abbrev is "SEE". northwestwest is a direction. it is weird. vh-abbrev is "NWW".

xness of southeasteast is 2. yness of southeasteast is -1. xness of northwestwest is -2. yness of northwestwest is 1.

the opposite of southeasteast is northwestwest. the opposite of northwestwest is southeasteast.

understand "see" and "ese" and "ees" as southeasteast.

understand "nww" and "wnw" and "wwn" as northwestwest.

southsouthwest is a direction. it is weird. vh-abbrev is "SSW". northnortheast is a direction. it is weird. vh-abbrev is "NNE".

xness of southsouthwest is -1. yness of southsouthwest is -2. xness of northnortheast is 1. yness of northnortheast is 2.

the opposite of southsouthwest is northnortheast. the opposite of northnortheast is southsouthwest.

understand "ssw" and "sws" and "wss" as southsouthwest.

understand "nne" and "nen" and "enn" as northnortheast.

southwestwest is a direction. it is weird. vh-abbrev is "SWW". northeasteast is a direction. it is weird. vh-abbrev is "NEE".

xness of southwestwest is -2. yness of southwestwest is -1. xness of northeasteast is 2. yness of northeasteast is 1.

the opposite of southwestwest is northeasteast. the opposite of northeasteast is southwestwest.

understand "sww" and "wsw" and "wws" as southwestwest.

understand "nee" and "ene" and "een" as northeasteast.

for printing the name of a weird direction (called d) when show-short-dirs is true: say "[vh-abbrev of d]"

section for seeing what's attacking who

xness of northwest is -1. yness of northwest is 1.

xness of northeast is 1. yness of northeast is 1.

xness of southwest is -1. yness of southwest is -1.

xness of southeast is 1. yness of southeast is -1.

xness of east is 1. yness of east is 0.

xness of west is -1. yness of west is 0.

xness of north is 0. yness of north is 1.

xness of south is 0. yness of south is -1.

section for posterity

xness of north is 0. yness of north is 1. xness of south is 0. yness of south is -1. xness of east is 1. yness of east is 0. xness of west is -1. yness of west is 0. xness of northwest is -1. yness of northwest is 1. xness of northeast is 1. yness of northeast is 1. xness of southwest is -1. yness of southwest is -1. xness of southeast is 1. yness of southeast is -1.

volume rooms

to decide which number is edge-count of (r - a room):
	let temp be 0;
	if x of r is 4 or y of r is 4, increment temp;
	if x of r is 0 or y of r is 0, increment temp;
	decide on temp;

definition: a room (called r) is edgy:
	if edge-count of r > 0, yes;
	no;

definition: a room (called r) is cornery:
	if edge-count of r is 2, yes;
	no;

a1 is a room. x of a1 is 0. y of a1 is 0. room-edge-text is "at the relatively inaccessible southwest corner".

b1 is a room. x of b1 is 1. y of b1 is 0. room-edge-text is "on the south edge and near the west edge".

c1 is a room. x of c1 is 2. y of c1 is 0. room-edge-text is "in the center of the south edge".

d1 is a room. x of d1 is 3. y of d1 is 0. room-edge-text is "on the south edge and near the east edge".

e1 is a room. x of e1 is 4. y of e1 is 0. room-edge-text is "at the relatively inaccessible southeast corner".

a2 is a room. x of a2 is 0. y of a2 is 1. room-edge-text is "on the west edge and near the south edge".

b2 is a room. x of b2 is 1. y of b2 is 1. room-edge-text is "in a southwest-ish area".

c2 is a room. x of c2 is 2. y of c2 is 1. room-edge-text is "just south of the center".

d2 is a room. x of d2 is 3. y of d2 is 1. room-edge-text is "in a southeast-ish area".

e2 is a room. x of e2 is 4. y of e2 is 1. room-edge-text is "on the east edge and near the south edge".

a3 is a room. x of a3 is 0. y of a3 is 2. room-edge-text is "at the center of the west edge".

b3 is a room. x of b3 is 1. y of b3 is 2. room-edge-text is "just west of the center".

c3 is a room. x of c3 is 2. y of c3 is 2. room-edge-text is "smack in the center".

d3 is a room. x of d3 is 3. y of d3 is 2. room-edge-text is "just east of the center".

e3 is a room. x of e3 is 4. y of e3 is 2. room-edge-text is "at the center of the east edge".

a4 is a room. x of a4 is 0. y of a4 is 3. room-edge-text is "on the west edge and near the north edge".

b4 is a room. x of b4 is 1. y of b4 is 3. room-edge-text is "in a northwest-ish area".

c4 is a room. x of c4 is 2. y of c4 is 3. room-edge-text is "just north of the center".

d4 is a room. x of d4 is 3. y of d4 is 3. room-edge-text is "in a northeast-ish area".

e4 is a room. x of e4 is 4. y of e4 is 3. room-edge-text is "on the east edge and near the north edge".

a5 is a room. x of a5 is 0. y of a5 is 4. room-edge-text is "at the relatively inaccessible northwest corner".

b5 is a room. x of b5 is 1. y of b5 is 4. room-edge-text is "on the north edge and near the west edge".

c5 is a room. x of c5 is 2. y of c5 is 4. room-edge-text is "in the center of the north edge".

d5 is a room. x of d5 is 3. y of d5 is 4. room-edge-text is "on the north edge and near the east edge".

e5 is a room. x of e5 is 4. y of e5 is 4. room-edge-text is "at the relatively inaccessible northeast corner".

the player is in c3.

to decide which room is room_of (n1 - a number) and (n2 - a number):
	repeat with Q running through rooms:
		if x of Q is n1 and y of Q is n2:
			decide on Q;
	if debug-state is true:
		say "Could not find room for [n1] and [n2].";
	decide on offsite

check going a normal direction:
	if noun is up, say "Your horse can fly across ground but not over it." instead;
	if noun is down, say "Your horse isn't built for that." instead;
	say "Your horse doesn't go in normal directions. It goes in diagonal ones. But not normal ones like southeast ([b]SE[r]). There's southsoutheast ([b]SSE, ESS, SES[r]) and, well, 7 others you may be able to extrapolate.[paragraph break][b]DIRS[r] gives a full rundown." instead;

volume initialization

when play begins:
	repeat with xval running from 0 to 3:
		repeat with yval running from 0 to 3:
			let r0 be room_of xval and yval;
			let re1 be room_of xval + 1 and yval;
			let rn1 be room_of xval and yval + 1;
			if r0 is offsite, next; [ shouldn't happen, but ... ]
			let rne be room_of xval + 1 and yval + 1;
			if rne is not offsite: [northeast]
				now rne is mapped northeast of r0;
				now r0 is mapped southwest of rne;
			if re1 is not offsite and rn1 is not offsite: [northwest]
				now rn1 is mapped northwest of re1;
				now re1 is mapped southeast of rn1;
			if re1 is not offsite:
				now r0 is mapped west of re1;
				now re1 is mapped east of r0;
			if rn1 is not offsite:
				now rn1 is mapped north of r0;
				now r0 is mapped south of rn1;
			let rn2 be room_of xval and yval + 2;
			let re2 be room_of xval + 2 and yval;
			let re2n1 be room_of xval + 2 and yval + 1;
			let rn2e1 be room_of xval + 1 and yval + 2;
			if re2n1 is not offsite:
				now r0 is mapped southwestwest of re2n1;
				now re2n1 is mapped northeasteast of r0;
			if rn2e1 is not offsite:
				now r0 is mapped southsouthwest of rn2e1;
				now rn2e1 is mapped northnortheast of r0;
			if rn2 is not offsite and re1 is not offsite:
				now re1 is mapped southsoutheast of rn2;
				now rn2 is mapped northnorthwest of re1;
			if re2 is not offsite and rn1 is not offsite:
				now re2 is mapped southeasteast of rn1;
				now rn1 is mapped northwestwest of re2;
	setup-next-puzzle;

volume people and quests

chapter general lists

max-wait-times is a list of numbers variable. max-wait-times is { 3, 4, 3, 0 }.

stalemated is a list of truth states variable. stalemated is { False, False, False, False }.

quest-quick-desc is a list of text variable. quest-quick-desc is { "R & R", "K & Q vs K", "K & R vs K", "Tour" }

chapter pieces

a piece is a kind of person. a piece can be reserved, irrelevant or placed. a piece is usually irrelevant. a piece has a list of truth state called summon-list. a piece has text called short-text.

a piece has a room called cached-position.

a piece can be tutorial-held. a piece is usually not tutorial-held.

description of a piece is usually "Right now, [the item described] looks ready to go chase an enemy king. But they may not wait too long. Better [if number of reserved pieces is 1]call your other allies and then [end if]call the enemy king soon."

check taking a piece:
	say "No, you put [the noun] here. But don't worry, if you did things wrong, you can try again." instead;

preferred-rook is a piece that varies.

does the player mean calling preferred-rook when quest-index is 1: it is likely.

definition: a piece (called p) is offensive:
	if p is enemy king, no;
	if p is irrelevant, no;
	yes;

the friendly king is a piece. understand "k" and "k1" and "fk" as friendly king. short-text of friendly king is "K". understand "my king" as friendly king.

summon-list of friendly king is { false, true, true, false }.

the enemy king is a piece. understand "k" and "k2" and "ek" as enemy king. short-text of enemy king is "K". understand "their king" as enemy king.

summon-list of enemy king is { true, true, true, false }.

the queen is a female piece. understand "q" as queen. short-text of queen is "Q".

summon-list of queen is { false, true, false, false }.

the kingside rook is a neuter piece. understand "kr" as kingside rook. understand "r" as kingside rook. short-text of kingside rook is "KR/R".

summon-list of kingside rook is { true, false, true, false }.

the queenside rook is a neuter piece. understand "qr" as queenside rook. understand "r" as queenside rook. short-text of queenside rook is "QR/R".

summon-list of queenside rook is { true, false, false, false }.

section bogus pices

a quasipiece is a kind of thing.

the pawn is a quasipiece. understand "p" as pawn.

the bishop is a quasipiece. understand "b/kb/qb" as bishop.

the knight is a quasipiece. understand "n/kn/qn" as knight.

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

definition: a piece (called p) is not-last:
	if p is enemy king, no;
	if p is reserved, yes;

rule for supplying a missing noun when calling:
	if quest-index is 4:
		say "You're on your own.";
		reject the player's command;
	if number of not-last pieces is 1:
		now noun is a random not-last piece;
	else if number of reserved pieces is 1:
		now noun is a random reserved piece;
	else if quest-index is 1:
		now noun is preferred-rook;
	else:
		say "You need to specify which ally to summon of [the list of not-last pieces].";
		reject the player's command.

this is the enemy-placement rule:
	if number of reserved pieces > 1:
		say "You probably don't want to summon the enemy king until last. He'd get really suspicious if you just made him wait around." instead;
	if enemy king is off-stage, continue the action;
	if absval of (x of location of enemy king - x of location of enemy king) < 2 and absval of (y of location of enemy king - y of location of enemy king) < 2:
		say "Wait, no, you can't put the enemy kings adjacent to each other, not even diagonally. They operate through intermediaries, apparently." instead;

carry out calling:
	if quest-index is 4, say "You're on your own now." instead;
	if noun is a quasipiece, say "You don't need to sumomon [the noun] in [5b]. Only kings, queens and rooks." instead;
	if noun is horse or noun is delenda or noun is the player, say "You're already here, with your horse and [delenda]." instead;
	if noun is not a piece, say "You can only summon (other) chess pieces." instead;
	if noun is placed:
		say "You already placed [the noun] at [location of the noun]." instead;
	if noun is irrelevant:
		say "Right now [the noun] is not part of your maneuver." instead;
	if number of pieces in location of player > 0:
		say "That would make things too crowded here at [location of player], since [the random piece in location of player] is already present." instead;
	if noun is enemy king:
		abide by the enemy-placement rule;
	say "You call [the noun] to [location of player].";
	now need-to-hurry is true;
	now noun is placed;
	move noun to location of player;
	if noun is not enemy king, update-guarded;
	show-the-board;
	if number of reserved pieces > 0, the rule succeeds;
	consider the takeit processing rule;
	if the rule succeeded:
		fail-and-reset instead;
		reset-the-board;
	consider the stalemate processing rule;
	if the rule succeeded:
		quest-conclusion;
		the rule succeeds;
	consider the checkmate processing rule;
	if the rule failed:
		if location of enemy king is not edgy:
			say "The enemy king had a lot of places to run. Maybe you should've summoned him to an edge, instead.";
		fail-and-reset instead;
	if the rule succeeded:
		quest-conclusion;
	the rule succeeds.

to update-guarded:
	now all rooms are not guarded;
	if friendly king is placed and in-tutorial is false:
		place-king;
	if queenside rook is placed or in-tutorial is true:
		place-range queenside rook and list of all cardinal directions;
	if kingside rook is placed and in-tutorial is false:
		place-range kingside rook and list of all cardinal directions;
	if queen is placed or in-tutorial is true:
		place-range queen and list of all planar directions;

to place-range (p - a piece) and (myl - a list of directions):
	let myx be x of location of p;
	let myy be y of location of p;
	repeat with dir running through myl:
		let temp-x be myx;
		let temp-y be myy;
		while 1 is 1:
			increase temp-x by xness of dir;
			increase temp-y by yness of dir;
			if temp-x > 4 or temp-x < 0, break;
			if temp-y > 4 or temp-y < 0, break;
			let myrm be room_of temp-x and temp-y;
			now myrm is guarded;
			if number of pieces in myrm > 0, break;

to place-king:
	let myx be x of location of friendly king;
	let myy be y of location of friendly king;
	repeat with mydir running through planar directions:
		let rm be room_of (myx + xness of mydir) and (myy + yness of mydir);
		now rm is guarded;

to quest-conclusion:
	say "[line break]";
	if quest-index is 1:
		say "The old king is dead! Long live the middle-aged king. He's going to be a bit sneakier. And he knows his father died in a corner -- so you may not be able to sucker him there. However, he makes indications he wants a diplomatic meeting with your king and queen.[paragraph break]NOTE: you will be able to see technical details of completed quest with [b]R[r] or [b]REVIEW[r].";
	 else if quest-index is 2:
		say "The king is dead, cut down in his prime! Long live the young king. Any show of overwhelming force is likely to intimidate him, but etiquette demands he meet with your king -- and perhaps one of your rooks will trail along. You wonder what you can do with that.";
	else if quest-index is 3:
		say "The young king is dead! The last of his line. All that remains for you to do is the traditional dance of victory and domination over a weaker country. It is time to walk over each of Fivebyfivia's twenty-five counties without repeating, to show your kingdom's efficiency in both conquering and providing vital constituent services. Okay, mostly conquering.[paragraph break]By the way, there is a new meta-verb. [b]T[r] or [b]TOUR[r] to toggles tour view mode, which shows an overall map of [5b] instead of telling you directions. It is set to on.";
		now show-tour-view is true;
	increment quest-index;
	setup-next-puzzle;

to show-the-board:
	if in-tutorial is false, say "STRATEGIC MAP OF FIVEBYFIVIA SO FAR:[line break]";
	say "[fixed letter spacing]  a b c d e[line break]";
	say "5[pie of a5][pie of b5][pie of c5][pie of d5][pie of e5] 5[line break]";
	say "4[pie of a4][pie of b4][pie of c4][pie of d4][pie of e4] 4[line break]";
	say "3[pie of a3][pie of b3][pie of c3][pie of d3][pie of e3] 3[line break]";
	say "2[pie of a2][pie of b2][pie of c2][pie of d2][pie of e2] 2[line break]";
	say "1[pie of a1][pie of b1][pie of c1][pie of d1][pie of e1] 1[line break]";
	say "  a b c d e[variable letter spacing][paragraph break]";
	if in-tutorial is true:
		say "Q = queen, R = queenside rook, k = enemy king, + = guarded square.";
		continue the action;
	say "[if in-tutorial is false]* = you, [end if]+ = square is guarded[if friendly king is not irrelevant], K = your king[end if][if queenside rook is not irrelevant or kingside rook is not irrelevant], R = rook[end if][if queen is not irrelevant], Q = queen[end if], k = enemy king.";

to say pie of (r - a room):
	say " ";
	if kingside rook is in r or queenside rook is in r:
		say "R";
	else if queen is in r:
		say "Q";
	else if friendly king is in r:
		say "K";
	else if enemy king is in r:
		say "k";
	else if r is location of player:
		say "*";
	else if r is guarded:
		say "+";
	else:
		say "-"

to decide which number is stalemate-count:
	let temp be 0;
	repeat with S running through stalemated:
		if S is True, increment temp;
	decide on temp;

after printing the locale description when quest-index is 4:
	now location of player is circle-visited;
	if debug-state is true:
		say "(DEBUG) [number of circle-visited rooms] visited, [number of not circle-visited rooms] unvisited.";
		if number of not circle-visited rooms < 5:
			say "(DEBUG) [list of not circle-visited rooms].";
	if number of circle-visited rooms is 25:
		say "Horns blare! Voices soar to the sky! You have trampled all of [5b], literally and figuratively! Now is time for your reward!";
		let t be stalemate-count;
		if stalemate-count is 3:
			say "Because of the lack of blood, other nations shake their head at [12b]'s annexation of [5b], but what can they do? Your discretion went above and beyond what the king and queen required of you. They delegate you to plan annexation of west, central and east Twelvebyfouria to the south. Each requires a slightly different solution: first, you take two knights, which people say couldn't be done -- but you did it! While they are shaking their heads in disbelief, you sweep in with a bishop and up-and-comer knight, then two bishops.[paragraph break]You grow old and fat and wise and powerful enough so nobody has the courage to mention you are too old and fat to ride your super-fast horse. Besides, they don't have the time, because they're always mentioning how powerful you are.";
		else:
			say "But the blood is traced back to you. Even if it was the royalty that did the work. Somehow, a blood-soaked garment ... you are turned over to an intenational medieval crime court as a sacrifice. Somehow, the royal family convinced everyone you and your crazy-moving horse acted on your own, before they could dissuade you. But everyone in [5b] seems happier to be annexed by [12b]. Or at least nobody has said they aren't, so no sense in returning [5b]'s sovereignty.[paragraph break]Plus, your day of martyry is a national holiday every year.";
		end the story;
	if number of circle-visited rooms is random-parchment-number and final-failed-yet is true and parchmente is off-stage:
		say "[one of]A small parchment flutters into view. It is labeled [parchmente][or][parchmente] flutters into view again[stopping]. It'd be so tempting to read it, and yet, your adventurous spirit has trouble balancing duty to country with the pure personal satisfaction of solving everything on your own.";
		move parchmente to location of player;

final-failed-yet is a truth state that varies.

random-parchment-number is a number that varies.

does the player mean calling a reserved piece: it is very likely.

does the player mean calling the enemy king when friendly king is reserved: it is very unlikely.

to setup-next-puzzle:
	reset-the-board;
	repeat with P running through pieces:
		if entry quest-index of summon-list of P is true:
			now P is reserved;
		else:
			now P is irrelevant;
	if quest-index is 1:
		if a random chance of 1 in 2 succeeds:
			now preferred-rook is queenside rook;
		else:
			now preferred-rook is kingside rook;

max-turns-after-placing is a number that varies.

current-turns-after-placing is a number that varies.

need-to-hurry is a truth state that varies.

to show-failure:
	say "[line break]        [b]* * * * LET'S TRY AGAIN * * * *[r][paragraph break]";

to fail-and-reset:
	show-failure;
	reset-the-board;

past-intro is a truth state that varies.

to reset-the-board:
	now all pieces are off-stage;
	now all placed pieces are reserved;
	now all rooms are not guarded;
	now max-turns-after-placing is entry quest-index of max-wait-times;
	now current-turns-after-placing is 0;
	now need-to-hurry is false;
	if quest-index is 4:
		now parchmente is off-stage;
		now all rooms are not circle-visited;
		now c3 is circle-visited;
		now random-parchment-number is a random number between 12 and 16;
		if debug-state is true, say "[random-parchment-number].";
	if past-intro is true:
		if location of player is not c3:
			say "You go back to c3 in the center to start again.";
		else:
			say "You're already at c3 in the center, so that saves time starting again.";
		move player to c3;
	else:
		now past-intro is true;

this is the takeit processing rule:
	let ek be the location of the enemy king;
	repeat with mydir running through planar directions:
		let newrm be the room mydir of ek;
		if newrm is nowhere, next;
		if newrm is not guarded and number of pieces in newrm > 0:
			say "Oh dear! The enemy king walks up to [the random piece in newrm] on [mydir] and gives it a good thwacking. Looks like your plans failed somewhere.[paragraph break]Oops. But don't worry. We'll pretend that never happened. For [12b]. And, yes, your own health and standing there.";
			the rule succeeds;

this is the stalemate processing rule:
	unless the location of the enemy king is not checked and the location of the enemy king is surrounded, the rule fails;
	say "The enemy king looks around. He sighs in relief, safe at the moment. But he is a busy man! He needs to get up and do things. Every which way he looks, though, he realize he's being watched. He quickly looks from left to right but surrenders.[paragraph break]Since nobody was directly attacking him, nobody gets the kill. He's taken prisoner. Everyone else looks at you funny.";
	now entry quest-index in stalemated is True;
	the rule succeeds;

definition: a room (called rm) is king-escape:
	if (absval of x of rm - x of location of enemy king) > 1, no;
	if (absval of y of rm - y of location of enemy king) > 1, no;
	if rm is checked, no;
	yes;

this is the checkmate processing rule:
	if the location of the enemy king is not checked:
		say "The enemy king looks at you funny. What did you bring him here for? Time's a-wasting. He shuffles off back to his palace.";
		the rule fails;
	if the location of the enemy king is not surrounded:
		say "The enemy king regards you suspiciously. He knows something is up. But then he runs away via [a random king-escape room]!";
		the rule fails;
	if quest-index is 2:
		let qx be absval of (x of location of queen - x of location of enemy king);
		let qy be absval of (y of location of queen - y of location of enemy king);
		if qx < 2 and qy < 2:
			say "Alas, a kink in your plans! The queen refuses, REFUSES to get close to that horrid enemy king. You thought you had things planned out well, but--well, maybe there is another way to get people together. But not too close. Perhaps using your horse's quick movements will help find a properly spacious arrangement.";
			the rule fails;
		if location of enemy king is cornery:
			say "Before you can summon the enemy king over, though, your allies call you by. That's a good formation, but maybe you will use it better in the future. It won't be a surprise if you use it twice. You take notes.";
			now got-rook-for-queen is true;
			the rule fails;
	say "The enemy king looks around, then runs one way, then another. Slowly it dawns on him. He is trapped! The end is not pretty.";
	the rule succeeds;

definition: a room (called r) is cornery:
	unless x of r is 4 or x of r is 0, no;
	unless y of r is 4 or y of r is 0, no;
	yes;

to decide which number is absval of (n - a number):
	if n > 0, decide on n;
	decide on 0 - n;

definition: a room (called r) is checked:
	if r is nothing, yes;
	if r is offsite, yes;
	let x0 be x of r;
	let y0 be y of r;
	repeat with q running through on-stage pieces:
		if q is irrelevant, next;
		let x1 be x of location of q;
		let y1 be y of location of q;
		let xdelt be absval of x1 - x0;
		let ydelt be absval of y1 - y0;
		if q is friendly king:
			if xdelt <= 1 and ydelt <= 1, yes;
			next;
		if q is kingside rook or q is queenside rook:
			if xdelt is 0 or ydelt is 0, yes;
			next;
		if q is queen:
			if xdelt is 0 or ydelt is 0, yes;
			if absval of xdelt is absval of ydelt, yes;
			next;
	no;

definition: a room (called r) is surrounded:
	repeat with D running through not weird directions:
		if the room D of r is nothing, next;
		if the room D of r is checked, next;
		no;
	yes;

volume clues

YE OLDE HINTE PARCHMENTE is a thing. printed name is "[i]YE OLDE HINTE PARCHMENTE[r]". "[parchmente] has fluttered to the ground here[if parch-take-count > 0]. It looks slightly worse for the wear than before. Perhaps it absorbed a bit of water, so it's not flying around as fast as it used to[end if].".

parch-take-count is a number that varies.

check taking PARCHMENTE:
	increment parch-take-count;
	say "[one of]It blows away before you can get close! Well, that's a bit of temptation resisted by default. Perhaps it will fly back into view later[or]This time, you snag the parchment[stopping].";
	if parch-take-count is 2:
		now player has PARCHMENTE;
	the rule succeeds;

description of YE OLDE HINTE PARCHMENTE is "[if player does not have parchmente]It's too far to read. You'll have to TAKE it to read it[else][parchment-tips][end if]."

read-so-far is a number that varies. read-so-far is 1.

this is the theres-more rule:
	say "There's more. Read it (Y, any other letter is N)?";
	let Q be the chosen letter;
	if Q is 89 or Q is 115, the rule succeeds;
	the rule fails;

to say parchment-tips:
	say "1. Ye must save the CORNER SQUARES for last.";
	if read-so-far < 2:
		consider the theres-more rule;
		unless the rule succeeded, continue the action;
		now read-so-far is 3;
	say "2. Ye have but one route to and from each CORNER SQUARE.";
	if read-so-far < 3:
		consider the theres-more rule;
		unless the rule succeeded, continue the action;
	say "3. If ye avoid such squares, you may soon find the next move is FORCED, saving thee considerable brain work."

volume regular verbs to reject

check pushing: say "You're not some boring old woodpusher who sits crouched over a board for hours on end. Besides, your allies can push themselves well enough. They're motivated enough." instead;

check pulling: say "You already pulled [the noun] away." instead;

volume meta

to say verbs: say "[b]V[r] or [b]VERB[r] or [b]VERBS[r]"

rule for printing a parser error:
	say "I didn't recognize that command. Type [verbs] to see the full list of commands. If you're confused what to do, [b]X[r] [delenda] again, or refer to the game [b]MAP[r]."

rule for printing a parser error when the latest parser error is the noun did not make sense in that context error:
	say "The verb was okay, but I didn't understand the noun in that sentence. You can type [verbs] to see how to use verbs with a subject."

rule for printing a parser error when the latest parser error is the only understood as far as error:
	say "You only needed the first word of that command. You can use the up arrow and backspace so you don't have to retype."

section inventory trivia

check taking inventory:
	say "You don't have much on you other than [delenda]. Your horse is built for speed and not for hauling stuff.[paragraph break][if delenda is not examined]You probably want to [b]X[r] [delenda][else]If you need a refresher, no shame in trying to [b]X[r] [delenda] again[end if]." instead;

section score trivia

check requesting the score:
	say "This game doesn't keep track of scores, but to give you an idea of your progress, you're on quest [quest-index] of [max-quests] right now." instead;

The print final score rule is not listed in the for printing the player's obituary rulebook.

chapter abbing

abbing is an action out of world.

understand the command "abbrev" as something new.
understand the command "abb" as something new.

understand "abbrev" as abbing.
understand "abb" as abbing.

carry out abbing:
	now show-short-dirs is whether or not show-short-dirs is false;
	say "Showing short directions is now [on-off of show-short-dirs].";
	the rule succeeds.

show-short-dirs is a truth state that varies.

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.
understand the command "a" as something new.

understand "about" as abouting.
understand "a" as abouting.

carry out abouting:
	say "This game was originally written for ParserComp 2021.[paragraph break]I'd always sort of had an idea to write up a game about chess, especially after playing Zork Zero, but I never quite found one that could be simple enough for people who didn't play and worthwhile enough for those who did. And even if it did balance these, where was the story?[paragraph break]I wasn't expecting one to pop up. The resurgence of chess online with COVID, along with tournaments like PogChamps, reminded me that there was a lot more to chess than twenty-move-deep theoretical slogs.[paragraph break]But one evening, something came into form. And as ParserComp's deadline came up, my bigger plan had stalled, so why not bail out?[paragraph break]I like parser games with weird directions. So I tried to make one.[paragraph break]Thankfully, I was able to find something that worked, technically, and it had the shell of a story, too. And I hope you enjoy this, too, whether or not you play chess.";
	the rule succeeds.

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

carry out boarding:
	if quest-index is 4, show-visited instead;
	show-the-board;
	the rule succeeds.

chapter chessing

chessing is an action out of world.

understand the command "chess" as something new.
understand the command "ch" as something new.

understand "chess" as chessing.
understand "ch" as chessing.

carry out chessing:
	say "Pawns and bishops do not appear in this game, so don't worry about them.";
	say "Knights (that's you) move one square vertically and two squares horizontally.";
	say "Rooks can move vertically or horizontally until there is an obstruction.";
	say "Queens can move vertically or horizontally or diagonally until there is an obstruction.";
	say "Kings can move one square adjacent, vertically or horizontally or diagonally, unless there is an obstruction.";
	say "Check occurs when one piece is attacking your king.";
	say "Checkmate is when you attack the enemy's king and he has no safe square nearby to flee to.";
	the rule succeeds.

chapter creditsing

creditsing is an action out of world.

understand the command "credits" as something new.

understand "credits" as creditsing.

carry out creditsing:
	say "Thanks to Wade Clarke and Arthur DiBianca and Garry Francis for testing.";
	say "[line break]Thanks to chessgames.com, chess.com and lichess.org for all the chess fun and puzzles and opponents from all over the globe. This all was especially nice during the pandemic.";
	the rule succeeds.

chapter dirsing

dirsing is an action out of world.

understand the command "dirs" as something new.
understand the command "dir" as something new.

understand "dirs" as dirsing.
understand "dir" as dirsing.

carry out dirsing:
	say "The eight directions your horse can travel are, clockwise from north, northnortheast, northeasteast, southeasteast, southsoutheast, southsouthwest, southwestwest, northwestwest and northnorthwest.";
	say "That's a bit long, so you can abbreviate them [b]NNE[r], [b] NEE[r], [b] SEE[r], [b] SSE[r], [b] SSW[r], [b] SWW[r], [b]NWW[r], [b]NNW[r] or any possible permutations. The game will treat all similar permutations as identical, e.g. there is no practical difference between [b]NNE[r], [b]NEN[r] and [b]ENN[r].";
	say "You can toggle how the directions appear (long or short) in room descriptions with [b]ABB[r].";
	the rule succeeds.

chapter helping

helping is an action out of world.

understand the command "help" as something new.
understand the command "hint" as something new.
understand the command "h" as something new.

understand "hint" as helping.
understand "help" as helping.
understand "h" as helping.

carry out helping:
	say "This game should come with a walkthrough. However, if you need a refresher on your quest, simply [b]X[r] [delenda] or just [b]X[r]. It's a bit short on details -- of course it is! Royalty tends to delegate like that.";
	if quest-index is 1:
		say "[line break]There is, however, the option for help with [b]TUT[r] for the first quest.";
	the rule succeeds.

chapter reviewing

reviewing is an action applying to nothing.

understand the command "review" as something new.
understand the command "rev" as something new.
understand the command "re" as something new.
understand the command "r" as something new.

understand "review" as reviewing.
understand "rev" as reviewing.
understand "re" as reviewing.
understand "r" as reviewing.

carry out reviewing:
	if quest-index is 1, say "Nothing to review yet." instead;
	say "Here's what you've got so far:[line break]";
	repeat with x running from 1 to quest-index - 1:
		choose row x in table of notes;
		say "[line break]";
		if entry x in stalemated is true:
			say "You stalemated the enemy king with [stalemate-notes entry].";
		else:
			say "[checkmate-notes entry].";
	the rule succeeds.

table of notes
stalemate-notes	checkmate-notes
"two rooks--in practical play, the most likely stalemate is one rook being diagonal from the corner, guarded by the other rook"	"You pinned the enemy king into the corner using the two rooks: one covering the side, one covering the row/column next to it. The process of cornering a king is known as a rook roll--the rooks start in adjacent rows, then one moves two over across the other, and so forth to the edge. Once you learn it, you're never gonna give it up."
"king and queen--there are so many ways to do this! The queen can force the king in the corner, or you don't move the king the right way"	"You trapped the enemy king with a queen and king. In practical play, the queen alone can drive the enemy king into the corner where he only has two squares to move, then your king walks in. Your queen just sits three squares up and one square left (or some rotation/mirroring) from the corner."
"king and rook--in practical play you probably won't see the position you got, and the only likely way is to have the rook, guarded by a king, diagonal from the corner"	"You trapped the king in the corner with your own king and rook. It's possible to trap the king on the side--your king is two squares away, off the edge, and the rook gives check. It's trickier for the king and rook to corner an enemy king, though. You have to make semi-waiting moves to slowly make the enemy king's rectangle smaller and smaller."

chapter statsing

statsing is an action applying to nothing.

understand the command "status" as something new.
understand the command "stats" as something new.
understand the command "stat" as something new.
understand the command "st" as something new.

understand "status" as statsing.
understand "stats" as statsing.
understand "st" as statsing.
understand "stat" as statsing.

definition: a room (called r) is knight-movable:
	repeat with D running through weird directions:
		if the room D of location of player is r, yes;
	no;

to say vis of (r - a room):
	say " ";
	if location of player is r:
		say "+";
	else if r is circle-visited:
		say "*";
	else if quest-index is 4 and r is knight-movable:
		say "?[no line break]";
	else:
		say " "

to show-visited:
	say "VISITED SO FAR:[line break]";
	say "[fixed letter spacing]  a b c d e[line break]";
	say "5[vis of a5][vis of b5][vis of c5][vis of d5][vis of e5] 5[line break]";
	say "4[vis of a4][vis of b4][vis of c4][vis of d4][vis of e4] 4[line break]";
	say "3[vis of a3][vis of b3][vis of c3][vis of d3][vis of e3] 3[line break]";
	say "2[vis of a2][vis of b2][vis of c2][vis of d2][vis of e2] 2[line break]";
	say "1[vis of a1][vis of b1][vis of c1][vis of d1][vis of e1] 1[line break]";
	say "  a b c d e[variable letter spacing][line break]";
	say "You've visited [number of circle-visited rooms] of [5b]'s twenty-five precincts.";

carry out statsing:
	if quest-index is 4:
		show-visited;
	else:
		say "Reserved pieces to (C)all: [list of reserved pieces].";
		say "Pieces out on the board: [list of placed pieces].";
	if quest-index is 3 and got-rook-for-queen is true:
		say "[line break]You remember how you almost trapped the enemy king before: him in the corner, your king a knight-move away, your queen another knight-move away. That would work here, too.";
	the rule succeeds.

after printing the name of a placed piece (called p) when statsing:
	say " ([b][location of p][r])";
	continue the action;

after printing the name of a reserved piece (called p) when statsing:
	say " ([b][short-text of p][r])";
	continue the action;

chapter ting

ting is an action applying to nothing.

understand the command "t" as something new.
understand the command "tour" as something new.

understand "t" as ting when quest-index is 4.
understand "tour" as ting when quest-index is 4.

carry out ting:
	now show-tour-view is whether or not show-tour-view is false;
	say "Tour view is now [on-off of show-tour-view].";
	the rule succeeds.

show-tour-view is a truth state that varies.

chapter tuting

in-tutorial is a truth state that varies.

tuting is an action applying to nothing.

understand the command "tut" as something new.

understand "tut" as tuting.

carry out tuting:
	now in-tutorial is true;
	now queenside rook is tutorial-held;
	now queen is tutorial-held;
	repeat with X running through pieces:
		now cached-position of X is location of X;
		move X to offsite;
	let my-row be 0;
	repeat through table of tutorial stuff:
		increment my-row;
		move queen to queen-pos entry;
		move queenside rook to rook-pos entry;
		move enemy king to king-pos entry;
		update-guarded;
		show-the-board;
		say "[blather entry][line break]";
		say "Type any key to continue[if my-row < 4] or Q to quit[end if].";
		let Q be the chosen letter;
		if Q is 81 or Q is 113, the rule succeeds;
	now in-tutorial is false;
	the rule succeeds.

table of tutorial stuff
queen-pos	rook-pos	king-pos	blather
a5	b4	b1	"Here the rook attacks the king, who has to move to the c-file."
c5	b4	c1	"Here the rook attacks the king, who has to move to the d-file."
c5	d4	d1	"Again the rook attacks the king, who has to move to the e-file."
e5	d4	e1	"The enemy king is trapped, since it can't move over. Maybe you can do the same with [if quest-index is 1]the two rooks[else]less material, but with the idea of pushing the enemy king against the edge."

chapter verbsing

verbsing is an action out of world.

understand the command "verbs" as something new.
understand the command "verb" as something new.
understand the command "v" as something new.

understand "verbs" as verbsing.
understand "verb" as verbsing.
understand "v" as verbsing.

carry out verbsing:
	say "The main verbs you can use are about going places. You have 8 different diagonal directions, which you can see in detail with [b]DIRS[r].";
	say "You can also [b]C[r]/[b]CALL[r] or [b]P[r]/[b]PLACE[r] allies or the [5b]n king. These are all the commands you need to win. [b]X[r] [delenda] for your current quest.";
	say "[line break]But there are also meta-commands. Of these, [b]M[r] or [b]MAP[r] to see the map at any time is likely to be the most useful. It shows you where your allies are and what they are guarding. [b]B[r] or [b]BOARD[r] also works.";
	say "General meta-commands include [b]ABOUT[r]/[b]A[r] and [b]CREDITS[r] for general game information and thanks.";
	say "You also have the option of toggling abbreviations of long directions with [b]ABB[r].";
	say "If you want a rules refresher, [b]CHESS[r] or [b]CH[r] will teach you all you need to know. Don't worry--you won't be quizzed on en passant!";
	if quest-index > 1:
		say "You can also [b]REVIEW[r] or [b]R[r] what you've done so far, though that's more for general chess endgame knowledge.";
	else if quest-index < 4:
		say "[b]TUT[r] provides a tutorial on how pieces move and how a queen and rook can trap the king, which may help you.";
	else:
		say "[b]T[r] toggles tour view for the quest between printing directions and printing a map.";
	say "And of course, there's this command, too: [b]VERBS[r]/[b]VERB[r]/[b]V[r].";
	say "[line break]While this is more nouns than vertbs, note you can often use abbreviations for nouns, e.g. [b]CALL Q[r] for the queen or [b]CALL KR[r] for the kingside rook or [b]CALL K[r] for the king.";
	the rule succeeds.

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "On the very east side of the world lie such repositories of hooliganism and pointless chance-taking as Backgammonton, Pokersfield or, worse, Yahtzeeburg. You dream of helping conquer them one day, but it is only a dream. A too-risky one at that.";

volume beta testing - not for release

when play begins:
	now in-beta is true;
	say "Beta testers have access to the commands TRY (1-4), to work on a particular quest, and WAYS. This text will not appear in the release, but if it does, that's my fault."

volume testing - not for release

when play begins:
	say "This should not show up in beta mode. It is a rule to toggle the debug-state truth state.";
	now debug-state is true;

chapter stupid stuff

test q1f with "call rook/nnw/call rook/ssw/call king".
test q1 with "ssw/nnw/see/see/call kingside/nww/call queenside/sww/call king".
test q1s with "nnw/call kingside/ssw/see/call queenside/sww/call king".

test q2f with "call queen/nnw/call king/ssw/call king".
test q2n with "ssw/nee/call queen/sww/nne/call king/sse/call king".
test q2 with "sse/call queen/nnw/ssw/nnw/call friendly king/sse/call enemy king".
test q2s with "nne/call friendly king/sww/sse/call queen/sww/call king".

test a2 with "test q1/test q2".

test q3f with "call rook/nnw/call king/ssw/call king".
test q3 with "sww/see/call rook/nnw/call friendly king/ssw/call enemy king".
test q3s with "sww/call rook/see/call friendly king/nne/sse/call enemy king".

test a3 with "test q1/test q2/test q3".

test q4f with "nnw/ssw/sse/nee/nne/nww/sww/sse/see/nne/nnw/sww/ssw/see/nee/nnw/sww/nnw/see/nee/sww".
test q4 with "nnw/ssw/sse/nee/nne/nww/sww/sse/see/nne/nnw/sww/ssw/see/nee/nnw/sww/nnw/see/nee/ssw/sse/nww/sww".

test win1 with "test q1/test q2/test q3/test q4".
test win2 with "test q1s/test q2s/test q3s/test q4".

chapter trying

trying is an action applying to one number.

understand the command "try" as something new.

understand "try [number]" as trying.

carry out trying:
	if number understood < 1 or number understood > 4:
		say "You need a number between 1 and 4." instead;
	if quest-index is number understood:
		say "We're already on that quest.";
	else:
		say "Moving to quest [number understood].";
	now quest-index is number understood;
	setup-next-puzzle;
	the rule succeeds.

chapter waysing

waysing is an action out of world.

understand the command "ways" as something new.

understand "ways" as waysing.

carry out waysing:
	repeat with Q running through weird directions:
		say "[Q] [the room Q of location of player].";
	repeat with Q running through { north, south, east, west }:
		say "[Q] [the room Q of location of player].";
	the rule succeeds.
