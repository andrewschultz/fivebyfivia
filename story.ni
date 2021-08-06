"Fivebyfivia Delenda Est" by Andrew Schultz

the story headline is "Flagrant Horsing Around".

the story description is "Less impossible than beating Stockfish".

section project settings

[cannot go into the common header]

release along with a website.

release along with the "Parchment" interpreter.

release along with cover art.

the release number is 2.

section project includes

to say github: say "https://github.com/andrewschultz/fivebyfivia-delenda-est"

volume basics and definitions

include Chess Common by Andrew Schultz.

max-quests is a number that varies. max-quests is 4.

quest-index is a number that varies. quest-index is 1.

moves-this-quest is a number that varies. moves-this-quest is 0.

description of the player is "You're quite the physical specimen under that armor. Not just any knight could ride your super-fast crazy horse that zigzags. But you've got confidence and cunning, too."

after examining a thing (called th):
	now th is examined;
	continue the action;

got-rook-for-queen is a truth state that varies.

chapter rooms

a room can be circle-visited. a room is usually not circle-visited.

[definition: a room (called r) is weird-viable:
	unless r is adjacent to player, no;
	if r is offsite, no;
	let d be the best way from l to location of player;
	if d is weird, yes;
	no;]

chapter start of play

when play begins (this is the initial screen tweaks rule):
	now right hand status line is "[entry quest-index of quest-quick-desc]";
	if debug-state is true, continue the action; [we have an option to change this, and y/n questions get in the way of automated testing]
	say "Fivebyfivia has some text-mapping options that may cause screen-readers to give useless output. Are you using a screen reader?";
	if the player consents:
		say "Potentially garbling options are now restricted.";
		now screen-reader is true;

when play begins (this is the start narration rule):
	say "Peace treaties get old and boring and stuffy after a while, y'know? They don't exactly keep up with the times. History changes. Perhaps the wimps who got a CLEAR bargain from the peace treaty don't deserve it any more.[paragraph break]That's definitely the case with [5b]. They've had fun for long enough. Besides, [12b] was called Elshapium when the treaty was signed, and now annexing [5b] would just about make a nice new square tidy country, pleasing to look at on a map.[paragraph break]Besides, if [12b] doesn't annex [5b], some far less civilized nation will. It's for their own good. Especially since gold and precious metals were discovered.[paragraph break]Thankfully, the [12b] spy ministry has devised a cunning plan to make sure things go as well as they can for [5b]. And you, a knight with a crazy (and crazy fast) horse, are just the person to help execute it! The old [5b]n king will never suspect you.[paragraph break]A solemn minister hands you a scroll entitled [FIVEBYFIVIA DELENDA EST]. And you're off!";
	now all pieces are in offsite;

chapter FIVEBYFIVIA DELENDA EST

FIVEBYFIVIA DELENDA EST is a thing. the player carries FIVEBYFIVIA DELENDA EST. description of DELENDA is "[DELENDA] contains the instructions for your current quest. Right now, it seems you need to [current-quest-text].[paragraph break][noun-abbrevs].".

to say noun-abbrevs:
	if quest-index is 4:
		say "There seem to be no useful scrawls in the margins for this final quest";
		continue the action;
	say "Scrawls in the margins indicate ways to think of your allies more efficiently. ";
	if in-tutorial is true:
		say "[b]Q[r] calls the Queen, [b]R[r] the rook, and [b]K[r] the enemy king";
		continue the action;
	if quest-index is 1:
		say "[b]KR[r] and [b]QR[r] pick a rook, though since they're functionally equivalent, [b]R[r] is just fine, too";
	else if quest-index is 2:
		say "Q[r] refers to the Queen";
	else if quest-index is 3:
		say "R refers to [the preferred-rook]";
	say ". [b]K[r] refers to your King if he's not placed and the enemy King if yours is. You could think [b]K1[r] and [b]K2[r], but since the enemy king should be called last (he may get suspicious if he has to wait around,) that may be excessive";

printed name of DELENDA is "[i]FIVEBYFIVIA DELENDA EST[r]".

understand "fde" as DELENDA.
understand "dfe" as DELENDA.
understand "est" as DELENDA.
understand "del" as DELENDA.
understand "scroll" as DELENDA.

after examining DELENDA for the first time:
	say "You may wish to shorten typing [delenda]'s long name to [b]FDE[r], [b]EST[r], or [b]DEL[r]. Or you can just type [b]X[r]. You're an ambitious knight, not some boring old scribe who writes big long fancy words out, just because. You have much more exciting ways to show off!"

to say current-quest-text:
	if quest-index is 4:
		say "trample around all twenty-five counties of [5b] without repeating twice";
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

chapter room info

the description of a room is usually "[room-color]. You're [room-edge-text of the item described] of [5b][commentary].".

to say commentary:
	let n be number of normal-viable directions;

to say room-color:
	say "The ground is [if the remainder after dividing (xval of location of player + yval of location of player) by 2 is 0]light[else]dark[end if]er than normal here"

rule for printing the locale description:
	if quest-index is 4:
		now location of player is circle-visited;
		if maps-in-description is true:
			show-visited;
			the rule succeeds;
	if maps-in-description is true:
		show-the-board;
	else:
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
	now room-too is true;
	say "You can go [list of weird-viable directions][if number of placed pieces is 0 and quest-index < 4] to search for the best place to CALL your first allies[end if]";
	now room-too is false:

room-too is a truth state that varies.

after printing the name of a direction (called d) when room-too is true:
	say " to [the room d of location of player]";

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
	let d2 be xness of d + xval of location of player;
	if d2 < 0:
		say "[character number 123 + d2]";
	else:
		say "[character number 97 + d2]";

to decide which number is square of (d - a direction):
	decide on 1 + yval of location of player + yness of d.

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
	if remainder after dividing moves-this-quest by 7 is 0 and number of placed pieces is 0:
		say "[line break]You're still looking around for the best square to [b]CALL[r] or [b]PLACE[r] allies. It's worth scouting around, but just so you know, more than one square works for the first piece, and even if you mess up, this quest will reset, and you can retry. It's worth experimenting.[paragraph break]Oh, and if you want to seriously plan things out, every other square is reachable in four moves from the center.";
	continue the action;

section circle-visited

after going to a circle-visited room:
	show-failure;
	say "A groan goes up across the land. You've been here before. Your triumphant tour is cut short. [if number of circle-visited cornery rooms > 0]You seemed to get trapped in the corner squares[else if number of circle-visited rooms < 10]Perhaps a bit of planning might help you get more places[else]You wonder if starting from the end -- any end -- might help you find a path through. You note that since c3 is a light square, and you move from light to dark squares and back, you will have to end on a light square after 24 moves--maybe cutting down the possibilities by starting on a less accessible light square would help[end if].";
	now final-failed-yet is true;
	say "[line break]";
	reset-the-board;

chapter info for knight directions

a direction can be normal or weird. a direction is usually normal. a direction has text called vh-abbrev.

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

section for posterity

volume rooms

room-edge-text of a1 is "at the relatively inaccessible southwest corner".

room-edge-text of b1 is "on the south edge and near the west edge".

room-edge-text of c1 is "in the center of the south edge".

room-edge-text of d1 is "on the south edge and near the east edge".

room-edge-text of e1 is "at the relatively inaccessible southeast corner".

room-edge-text of a2 is "on the west edge and near the south edge".

room-edge-text of b2 is "in a southwest-ish area".

room-edge-text of c2 is "just south of the center".

room-edge-text of d2 is "in a southeast-ish area".

room-edge-text of e2 is "on the east edge and near the south edge".

room-edge-text of a3 is "at the center of the west edge".

room-edge-text of b3 is "just west of the center".

room-edge-text of c3 is "smack in the center".

room-edge-text of d3 is "just east of the center".

room-edge-text of e3 is "at the center of the east edge".

room-edge-text of a4 is "on the west edge and near the north edge".

room-edge-text of b4 is "in a northwest-ish area".

room-edge-text of c4 is "just north of the center".

room-edge-text of d4 is "in a northeast-ish area".

room-edge-text of e4 is "on the east edge and near the north edge".

room-edge-text of a5 is "at the relatively inaccessible northwest corner".

room-edge-text of b5 is "on the north edge and near the west edge".

room-edge-text of c5 is "in the center of the north edge".

room-edge-text of d5 is "on the north edge and near the east edge".

room-edge-text of e5 is "at the relatively inaccessible northeast corner".

the player is in c3.

check going a normal direction:
	if noun is up, say "Your horse can fly across ground but not over it." instead;
	if noun is down, say "Your horse isn't built for that." instead;
	say "Your horse doesn't go in normal directions. It goes in diagonal ones. But not normal ones like southeast ([b]SE[r]). There's southsoutheast ([b]SSE, ESS, SES[r]) and, well, 7 others you may be able to extrapolate.[paragraph break][b]DIRS[r] gives a full rundown." instead;

volume initialization

when play begins:
	repeat with xval running from 0 to 3:
		repeat with yval running from 0 to 3:
			let r0 be room-from-nums of xval and yval;
			let re1 be room-from-nums of xval + 1 and yval;
			let rn1 be room-from-nums of xval and yval + 1;
			if r0 is offsite, next; [ shouldn't happen, but ... ]
			let rne be room-from-nums of xval + 1 and yval + 1;
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
			let rn2 be room-from-nums of xval and yval + 2;
			let re2 be room-from-nums of xval + 2 and yval;
			let re2n1 be room-from-nums of xval + 2 and yval + 1;
			let rn2e1 be room-from-nums of xval + 1 and yval + 2;
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
	say "[line break][bracket]NOTE: [5b] has different commands from standard adventures, including options that may make navigation easier. The [b]ABOUT[r]/[b]A[r] and [verbs] commands describe them.[close bracket][line break]";

volume people and quests

chapter general lists

max-wait-times is a list of numbers variable. max-wait-times is { 3, 4, 3, 0 }.

stalemated is a list of truth states variable. stalemated is { False, False, False, False }.

quest-quick-desc is a list of text variable. quest-quick-desc is { "R & R", "K & Q vs K", "K & R vs K", "Tour" }

chapter pieces

a piece has a list of truth state called summon-list. a piece has text called short-text.

a piece has a room called cached-position. cached-position of a piece is usually offsite.

a piece can be tutorial-held. a piece is usually not tutorial-held.

description of a piece is usually "Right now, [the item described] looks ready to go chase an enemy king. But they may not wait too long. Better [if number of reserved pieces is 1]call your other allies and then [end if]call the enemy king soon."

check taking a piece:
	say "No, you put [the noun] here. But don't worry, if you did things wrong, you can try again." instead;

preferred-rook is a piece that varies.

does the player mean calling preferred-rook: it is likely. [ this is to avoid disambiguation that gets rejected either way e.g. "do you want the kingside or queenside rook?" / either / "That is not part of your maneuvers." ]

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

summon-list of kingside rook is { true, false, false, false }.

the queenside rook is a neuter piece. understand "qr" as queenside rook. understand "r" as queenside rook. short-text of queenside rook is "QR/R".

summon-list of queenside rook is { true, false, false, false }.

section bogus pices

a quasipiece is a kind of thing.

the pawn is a quasipiece. understand "p" as pawn.

the bishop is a quasipiece. understand "b/kb/qb" as bishop.

the knight is a quasipiece. understand "n/kn/qn" as knight.

chapter calling

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

this is the enemy-king-placement rule:
	if number of reserved pieces > 1:
		say "You probably don't want to summon the enemy king until last. He'd get really suspicious if you just made him wait around." instead;
	let ax be absval of (xval of location of player - xval of location of friendly king);
	let ay be absval of (yval of location of player - yval of location of friendly king);
	if  ax < 2 and ay < 2:
		say "Wait, no, you can't put the enemy kings adjacent to each other[if ax is 1 and ay is 1], not even diagonally[end if]. They operate through intermediaries, apparently." instead;

carry out calling:
	if quest-index is 4, say "You're on your own now." instead;
	if noun is a quasipiece, say "You don't need to sumomon [the noun] in [5b]. Only kings, queens and rooks." instead;
	if noun is horse or noun is delenda or noun is the player, say "You're already here, with your horse and [delenda]." instead;
	if noun is not a piece, say "You can only summon (other) chess pieces." instead;
	if noun is placed:
		say "You already placed [the noun] at [location of the noun]." instead;
	if noun is irrelevant:
		say "Right now [the noun] is not part of your maneuver. You can, however, call [the list of reserved pieces]." instead;
	if number of pieces in location of player > 0:
		say "That would make things too crowded here at [location of player], since [the random piece in location of player] is already present." instead;
	if noun is enemy king:
		abide by the enemy-king-placement rule;
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
	let myx be xval of location of p;
	let myy be yval of location of p;
	repeat with dir running through myl:
		let temp-x be myx;
		let temp-y be myy;
		while 1 is 1:
			increase temp-x by xness of dir;
			increase temp-y by yness of dir;
			if temp-x > 4 or temp-x < 0, break;
			if temp-y > 4 or temp-y < 0, break;
			let myrm be room-from-nums of temp-x and temp-y;
			now myrm is guarded;
			if number of pieces in myrm > 0, break;

to place-king:
	let myx be xval of location of friendly king;
	let myy be yval of location of friendly king;
	repeat with mydir running through planar directions:
		let rm be room-from-nums of (myx + xness of mydir) and (myy + yness of mydir);
		now rm is guarded;

to quest-conclusion:
	say "[line break]";
	if quest-index is 1:
		say "The old king is dead! Long live the middle-aged king. He's going to be a bit sneakier. And he knows his father died in a corner -- so you may not be able to sucker him there. However, he makes indications he wants a diplomatic meeting with your king and queen.[paragraph break]NOTE: you will be able to see technical details of completed quest with [b]R[r] or [b]REVIEW[r].";
	 else if quest-index is 2:
		say "The king is dead, cut down in his prime! Long live the young king. Any show of overwhelming force is likely to intimidate him, but etiquette demands he meet with your king -- and perhaps one of your rooks will trail along. You wonder what you can do with that.";
	else if quest-index is 3:
		say "The young king is dead! The last of his line. All that remains for you to do is the traditional dance of victory and domination over a weaker country. It is time to walk over each of Fivebyfivia's twenty-five counties without repeating, to show your kingdom's efficiency in both conquering and providing vital constituent services. Okay, mostly conquering.";
		if screen-reader is false, now maps-in-description is true;
	increment quest-index;
	setup-next-puzzle;

to show-the-board:
	if screen-reader is true:
		if number of placed pieces is 0:
			say "You haven't placed any pieces yet.";
			continue the action;
		say "Currently placed:";
		repeat with Q running through placed pieces:
			say "[Q] is at [location of Q].";
		continue the action;
	if in-tutorial is false, say "STRATEGIC MAP OF FIVEBYFIVIA SO FAR:[line break]";
	say "[fixed letter spacing]  a b c d e[line break]";
	say "5[pie of a5][pie of b5][pie of c5][pie of d5][pie of e5] 5[line break]";
	say "4[pie of a4][pie of b4][pie of c4][pie of d4][pie of e4] 4[line break]";
	say "3[pie of a3][pie of b3][pie of c3][pie of d3][pie of e3] 3[line break]";
	say "2[pie of a2][pie of b2][pie of c2][pie of d2][pie of e2] 2[line break]";
	say "1[pie of a1][pie of b1][pie of c1][pie of d1][pie of e1] 1[line break]";
	say "  a b c d e[variable letter spacing][paragraph break]";
	if in-tutorial is true:
		say "Q = queen, R = rook, k = enemy king, + = guarded square.";
		continue the action;
	say "[if in-tutorial is false]* = you, ^ = available in one move, [end if]+ = square is guarded[if friendly king is not irrelevant], K = your king[end if][if queenside rook is not irrelevant or kingside rook is not irrelevant], R = rook[end if][if queen is not irrelevant], Q = queen[end if], k = enemy king.";

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
	else if r is location of player and in-tutorial is false:
		say "*";
	else if r is guarded:
		say "+";
	else if r is knight-movable and in-tutorial is false:
		say "^";
	else:
		say "-"

to decide which number is stalemate-count:
	let temp be 0;
	repeat with S running through stalemated:
		if S is True, increment temp;
	decide on temp;

after printing the locale description when quest-index is 4:
	if debug-state is true:
		say "(DEBUG) [number of circle-visited rooms] visited, [number of not circle-visited rooms] unvisited.";
		if number of not circle-visited rooms < 5:
			say "(DEBUG) [list of not circle-visited rooms].";
	if number of circle-visited rooms is 25:
		say "Horns blare! Voices soar to the sky! You have trampled all of [5b], literally and figuratively! Now is time for your reward!";
		let t be stalemate-count;
		if stalemate-count is 3:
			say "Because of the lack of blood, other nations shake their head at [12b]'s annexation of [5b], but what can they do? Your discretion went above and beyond what the king and queen required of you. Perhaps there will be, with time, opportunities for further clandestine annexations.[paragraph break]You grow old and fat and wise and powerful enough so nobody has the courage to mention you are too old and fat to ride your super-fast horse. Besides, they don't have the time, because they're always mentioning how powerful you are.";
			end the story finally saying "The beginning of a glorious (?) empire";
		else:
			say "But the blood is traced back to you. Even if it was the royalty that did the work. Somehow, a blood-soaked garment ... you are turned over to an international medieval crime court as a sacrifice. Somehow, the royal family convinced everyone you and your crazy-moving horse acted on your own, before they could dissuade you. But everyone in [5b] seems happier to be annexed by [12b]. Or at least nobody has said they aren't, so no sense in returning [5b]'s sovereignty.[paragraph break]Plus, your day of martyry is a national holiday every year.[paragraph break]Perhaps there was a way to be even more cunning than you were[if stalemate-count > 1]. Hint: you figured things partially[end if].";
			end the story finally;
	if number of circle-visited rooms is random-parchment-number and final-failed-yet is true and parchmente is off-stage:
		say "[one of]A small parchment flutters into view. It is labeled [parchmente][or][parchmente] flutters into view again[stopping]. It'd be so tempting to read it, and yet, your adventurous spirit has trouble balancing duty to country with the pure personal satisfaction of solving everything on your own.";
		move parchmente to location of player;

final-failed-yet is a truth state that varies.

random-parchment-number is a number that varies.

does the player mean calling a reserved piece: it is very likely.

does the player mean calling the enemy king when friendly king is reserved: it is very unlikely.

definition: a piece (called p) is accessory:
	if p is irrelevant, no;
	if p is enemy king, no;
	yes;

to setup-next-puzzle:
	reset-the-board;
	if quest-index < 4: [ maybe this randomization is self-indulgent, but the QR and KR are functionally equivalent. ]
		if a random chance of 1 in 2 succeeds:
			now preferred-rook is queenside rook;
		else:
			now preferred-rook is kingside rook;
		if quest-index is 3:
			now entry 3 of summon-list of preferred-rook is true;
	repeat with P running through pieces:
		if entry quest-index of summon-list of P is true:
			now P is reserved;
		else:
			now P is irrelevant;
	if quest-index is 4:
		say "No allies this time.";
	else:
		say "So, your quest: you need to coordinate your king with [the list of accessory pieces]. It's also shorthanded in the status line in the upper right."

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
	now all pieces are in offsite;
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
		if debug-state is true, say "DEBUG [random-parchment-number].";
	if past-intro is true:
		say "[if location of player is not c3]You go back to c3 in the center to start again[else]You're already at c3 in the center, so that saves time starting again[end if]. Time to re-summon [the list of accessory pieces].";
		if location of player is not c3:
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
	say "The enemy king looks around. He sighs in relief, safe at the moment. But he is a busy man! He needs to get up and do things. Every which way he looks, though, he realize he's being watched. He quickly looks from left to right but surrenders.[paragraph break]Since nobody was directly attacking him, nobody gets the kill. He's taken prisoner. Everyone else looks at you funny. All this roundabout capturing stuff just isn't in the spirit of classical warfare!";
	now entry quest-index in stalemated is True;
	the rule succeeds;

definition: a room (called rm) is king-escape:
	if (absval of xval of rm - xval of location of enemy king) > 1, no;
	if (absval of yval of rm - yval of location of enemy king) > 1, no;
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
		let qx be absval of (xval of location of queen - xval of location of enemy king);
		let qy be absval of (yval of location of queen - yval of location of enemy king);
		if qx < 2 and qy < 2:
			say "Alas, a kink in your plans! The queen refuses, REFUSES to get close to that horrid enemy king. You thought you had things planned out well, but--well, maybe there is another way to get people together. But not too close. Perhaps using your horse's quick movements will help find a properly spacious arrangement.";
			the rule fails;
		if location of enemy king is cornery:
			say "Before you can summon the enemy king over, though, your allies call you by. That's a good formation, but maybe you will use it better in the future. It won't be a surprise if you use it twice. You take notes.";
			now got-rook-for-queen is true;
			the rule fails;
	say "The enemy king looks around, then runs one way, then another. Slowly it dawns on him. He is trapped! The end is not pretty.";
	the rule succeeds;

definition: a room (called r) is checked:
	if r is nothing, yes;
	if r is offsite, yes;
	let x0 be xval of r;
	let y0 be yval of r;
	repeat with q running through on-stage pieces:
		if q is irrelevant, next;
		let x1 be xval of location of q;
		let y1 be yval of location of q;
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

chapter gotoing

rule for supplying a missing noun when gotoing:
	if quest-index is 4:
		if number of visit-viable directions is 1:
			let d be a random visit-viable direction;
			let next-room be the room d of location of player;
			say "There's only one square available that you haven't visited yet, [next-room]. So let's go there.";
			try going d instead;
		if number of visit-viable directions is 0:
			say "Looks like you're trapped. But you can always restart.";
		say "You'll need to be more specific where you want to go--though if there's only one room you can visit from your current square, 'g' will send you there.";
		reject the player's command;
	say "You need to specify which square to go to.";

to decide which number is x-dist of (r1 - a room) and (r2 - a room):
	decide on absval of (xval of r1) - (xval of r2);

to decide which number is y-dist of (r1 - a room) and (r2 - a room):
	decide on absval of (yval of r1) - (yval of r2);

carry out gotoing:
	abide by the already-here rule;
	let xd be x-dist of location of player and noun;
	let yd be y-dist of location of player and noun;
	if xd < yd:
		let temp be xd;
		now xd is yd;
		now yd is temp;
	repeat through table of distances to moves:
		if lesser entry is not yd or greater entry is not xd, next;
		let prob-moves be general entry;
		if there is a corner entry:
			say "1.";
			if location of player is cornery or noun is cornery:
				now prob-moves is corner entry;
		if prob-moves > 1 and quest-index is 4:
			say "You need to run around efficiently, but that's too fast. Since you need to visit the counties in order, I'm going to be a stickler and only let you move between knight-adjacent rooms, even though there might be just one valid short path between, say, a2 and d1.";
			the rule fails;
		if need-to-hurry is true and prob-moves + current-turns-after-placing > max-turns-after-placing:
			say "But then you would run out of time to summon everyone.";
			the rule fails;
		say "Your horse zooms [if prob-moves > 1]around for [prob-moves] moves[else]briefly[end if] to [noun].";
		move player to noun;
		if need-to-hurry is true:
			increase current-turns-after-placing by prob-moves;
		the rule succeeds;
	say "BUG. I don't khow what happened, but I didn't find distances between rooms.";
	the rule succeeds;

table of distances to moves
lesser	greater	general	corner
0	0	0	--
0	1	3	--
0	2	2	--
0	3	3	--
0	4	2	--
1	1	2	4
1	2	1	--
1	3	2	--
1	4	3	--
2	2	4	--
2	3	3	--
2	4	2	--
3	3	2	--
3	4	3	--
4	4	4	--

volume clues

YE OLDE HINTE PARCHMENTE is a thing. printed name is "[i]YE OLDE HINTE PARCHMENTE[r]". "[parchmente] has fluttered to the ground here[if parch-take-count > 0]. It looks slightly worse for the wear than before. Perhaps it absorbed a bit of water, so it's not flying around as fast as it used to[end if].".

parch-take-count is a number that varies.

check taking PARCHMENTE:
	increment parch-take-count;
	say "[one of]It blows away before you can get close! Well, that's a bit of temptation resisted by default. Perhaps it will fly back into view sooner or later (fourth wall break: it should be sooner.)[or]This time, you snag the parchment.[stopping]";
	if parch-take-count is 2:
		now player has PARCHMENTE;
	the rule succeeds;

description of YE OLDE HINTE PARCHMENTE is "[if player does not have parchmente]The writing's too small to read when it's on the ground. You'll have to TAKE it to read it[else][parchment-tips][end if]"

read-so-far is a number that varies. read-so-far is 1.

this is the theres-more rule:
	say "There's more. Read it (Y, any other letter is N)?";
	let Q be the chosen letter;
	if Q is 89 or Q is 121, the rule succeeds;
	the rule fails;

to say parchment-tips:
	say "1. Ye must save CERTAIN COUNTIES for last. Which might they be?";
	if read-so-far < 2:
		consider the theres-more rule;
		unless the rule succeeded, continue the action;
		now read-so-far is 2;
	say "2. Ye must save the CORNER COUNTIES for last.";
	if read-so-far < 3:
		consider the theres-more rule;
		unless the rule succeeded, continue the action;
		now read-so-far is 3;
	say "3. Ye have but one route to and from each CORNER COUNTY.";
	if read-so-far < 4:
		consider the theres-more rule;
		unless the rule succeeded, continue the action;
		now read-so-far is 4;
	say "4. If ye avoid such CORNER COUNTIES, you may soon find the next move is FORCED, saving thee considerable brain work.[no line break]"

volume meta

report undoing an action:
	if quest-index is 4:
		say "Undone. Whether this makes the final tour doable, I'm too lazy to calculate. But don't worry. You can restart if you need to.";
	else:
		say "Undone[if number of placed pieces is 0], though until you've placed a piece, there's nothing worth undoing[end if]. Note you can always undo everything with [b]F[r] or [b]FAIL[r].";

section inventory trivia

check taking inventory:
	say "You don't have much on you other than [delenda]. Your horse is built for speed and not for hauling stuff.[paragraph break][if delenda is not examined]You probably want to [b]X[r] [delenda][else]If you need a refresher, no shame in trying to [b]X[r] [delenda] again[end if]." instead;

section score trivia

check requesting the score:
	say "This game doesn't keep track of scores, but to give you an idea of your progress, you're on quest [quest-index] of [max-quests] right now." instead;

chapter abbing

carry out abbing:
	now show-short-dirs is whether or not show-short-dirs is false;
	say "Showing short directions is now [on-off of show-short-dirs].";
	the rule succeeds.

show-short-dirs is a truth state that varies.

chapter abouting

carry out abouting:
	say "This game was originally written for ParserComp 2021.[paragraph break]I'd always sort of had an idea to write up a game about chess, especially after playing Zork Zero, but I never quite found one that could be simple enough for people who didn't play and worthwhile enough for those who did. And even if it did balance these, where would the story be? I wasn't expecting anything to pop up.[paragraph break]The resurgence of chess online with COVID, along with tournaments like PogChamps, reminded me that there was a lot more to chess than twenty-move-deep theoretical slogs.[paragraph break]Then one evening, something came into form. And as ParserComp's deadline came up, my bigger planned game had stalled, so why not bail out?[paragraph break]I had some initial doubts, but I started to see how I could work around them. The result was something that worked technically, addressed an odd sort of position that always amused me, and it had the shell of a story, too. I'd also wanted to do some programming related to chess, so I had fun. And I hope you enjoy this, too, whether or not you play chess.[paragraph break]If this is still during ParserComp, please also check out the other games (17 others!) and try to leave a transcript. For Z-machine games, typing TRANSCRIPT helps--even if you can't find anything or leave comments, the programmer may notice certain things worth fixing from how you play, e.g. they wanted to make a hint more prominent. My address is [email].[paragraph break][b]CREDITS[r]/[b]CR[r] has more information about specific people who helped me.";
	the rule succeeds.

chapter boarding

carry out boarding:
	if quest-index is 4, show-visited instead;
	show-the-board;
	the rule succeeds.

chapter chessing

carry out chessing:
	say "Pawns and bishops do not appear in this game, so don't worry about them.";
	say "Knights (that's you) move one square vertically and two squares horizontally.";
	say "Rooks can move vertically or horizontally until there is an obstruction.";
	say "Queens can move vertically or horizontally or diagonally until there is an obstruction.";
	say "Kings can move one square adjacent, vertically or horizontally or diagonally, unless there is an obstruction.";
	say "Check occurs when one piece is attacking your king.";
	say "Checkmate is when you attack the enemy's king and he has no safe square nearby to flee to.";
	say "Stalemate is when the enemy has no legal moves, but the king is not under attack.";
	the rule succeeds.

chapter creditsing

carry out creditsing:
	say "Thanks to Wade Clarke, Dee Cooke, Arthur DiBianca, Garry Francis and Olaf Nowacki for testing. I know my games are tricky to test, especially when I have the idea 2-3 weeks before the deadline.";
	say "[line break]Thanks to Adam Sommerfield for holding ParserComp and for allowing updates. I tried not to need them but failed.";
	say "[line break]Thanks to the people on itch.io who reported bugs in-comp, including salty-horse. It may seem trivial, but trust me: after that first five minutes of 'Geez, that can't be it. Wait, did I overlook THAT?' it's very much appreciated. If you find a bug, report it at [github] or send me a mail at [email].";
	say "[line break]Thanks to chessgames.com, chess.com and lichess.org for all the chess fun and puzzles and opponents from all over the globe. This all has been especially nice during the pandemic.";
	the rule succeeds.

chapter dirsing

dirsing is an action out of world.

understand the command "dirs" as something new.
understand the command "dir" as something new.

understand "dirs" as dirsing.
understand "dir" as dirsing.

carry out dirsing:
	say "There are eight directions your horse can travel, clockwise from north: northnortheast, northeasteast, southeasteast, southsoutheast, southsouthwest, southwestwest, northwestwest and northnorthwest.";
	say "[line break]That's a bit long, so you can abbreviate them [b]NNE[r], [b] NEE[r], [b] SEE[r], [b] SSE[r], [b] SSW[r], [b] SWW[r], [b]NWW[r], [b]NNW[r] or any possible permutations. The game will treat all similar permutations as identical, e.g. there is no practical difference between [b]NNE[r], [b]NEN[r] and [b]ENN[r].";
	say "[line break]You can toggle how the directions appear (long or short) in room descriptions with [b]ABB[r] or [b]A[r].";
	the rule succeeds.

chapter fail

carry out failing:
	if number of placed pieces is 0 and quest-index < 4:
		say "You haven't placed any pieces yet." instead;
	say "Okay, let's end things early...";
	reset-the-board;
	the rule succeeds;

chapter helping

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
			say "[checkmate-notes entry][line break]";
	the rule succeeds.

table of notes
stalemate-notes	checkmate-notes
"two rooks--in practical play, the most likely stalemate is one rook being diagonal from the corner, guarded by the other rook"	"You pinned the enemy king into the corner using the two rooks: one covering the side, one covering the row/column next to it. The process of cornering a king is known as a rook roll--the rooks start in adjacent rows, then one moves two over across the other, and so forth to the edge. Once you learn it, you're never gonna give it up."
"king and queen--there are so many ways to do this! The queen can force the king in the corner, or you don't move the king the right way"	"You trapped the enemy king with a queen and king. In practical play, the queen alone can drive the enemy king into the corner where he only has two squares to move, then your king walks in. Your queen just sits three squares up and one square left (or some rotation/mirroring) from the corner."
"king and rook--in practical play you probably won't see the position you got, and the only likely way is to have the rook, guarded by a king, diagonal from the corner"	"You trapped the king in the corner with your own king and rook. It's possible to trap the king on the edge and not the corner--your king is two squares from the enemy (called the opposition,) and the rook gives check. It's slower for the king and rook to corner an enemy king than for an enemy queen, though. Sometimes you have to move your king instead of your rook as you make the enemy king's rectangle smaller and smaller."

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
	else if r is knight-movable:
		say "?[no line break]";
	else:
		say " "

definition: a room (called r) is circle-to-visit:
	if r is offsite, no;
	if r is circle-visited, no;
	yes;

definition: a room (called r) is safe-knight-movable:
	if r is circle-visited, no;
	if r is knight-movable, yes;
	no;

to show-visited:
	if screen-reader is true:
		if number of circle-visited rooms < 13:
			say "You've visited [list of circle-visited rooms] so far.";
		else:
			say "You still need to visit [list of circle-to-visit rooms].";
		if number of safe-knight-movable rooms > 0:
			say "Of the above, you can immediately visit [list of safe-knight-movable rooms] from here.";
		else:
			say "Sadly, there are no rooms you can safely visit from here.";
		continue the action;
	say "VISITED SO FAR:[line break]";
	say "[fixed letter spacing]  a b c d e[line break]";
	say "5[vis of a5][vis of b5][vis of c5][vis of d5][vis of e5] 5[line break]";
	say "4[vis of a4][vis of b4][vis of c4][vis of d4][vis of e4] 4[line break]";
	say "3[vis of a3][vis of b3][vis of c3][vis of d3][vis of e3] 3[line break]";
	say "2[vis of a2][vis of b2][vis of c2][vis of d2][vis of e2] 2[line break]";
	say "1[vis of a1][vis of b1][vis of c1][vis of d1][vis of e1] 1[line break]";
	say "  a b c d e[variable letter spacing][line break]";
	say "You've visited [number of circle-visited rooms in words] of [5b]'s twenty-five counties.";

carry out statsing:
	if quest-index is 4:
		show-visited;
	else:
		say "Reserved pieces to (C)all: [list of reserved pieces].";
		say "Pieces out on the board: [if number of placed pieces is 0]none, yet[else][list of placed pieces][end if].";
	if quest-index is 3 and got-rook-for-queen is true:
		say "[line break]You remember how you almost trapped the enemy king before: him in the corner, your king a knight-move away, your queen another knight-move away. That would work here, too.";
	the rule succeeds.

after printing the name of a placed piece (called p) when statsing:
	say " ([b][location of p][r])";
	continue the action;

after printing the name of a reserved piece (called p) when statsing:
	say " ([b][short-text of p][r])";
	continue the action;

chapter toggleing

carry out toggleing:
	if screen-reader is true, say "Toggling maps in the room description would cause the screen reader to make strange outputs, so I'm restricting it." instead;
	now maps-in-description is whether or not maps-in-description is false;
	say "Toggling maps in the room description to [on-off of maps-in-description].";
	the rule succeeds.

maps-in-description is a truth state that varies.

chapter tuting

in-tutorial is a truth state that varies.

tuting is an action applying to nothing.

understand the command "tut" as something new.

understand "tut" as tuting.

carry out tuting:
	if screen-reader is true:
		say "(Text maps bowdlerized for screen reader.) For checkmate with a queen and rook, you put a rook on the file next to the queen, then move the queen two right past the rook, then the rook two right past the queen, until the enemy king is up against the side of the board and attacked and cannot move.";
		the rule succeeds;
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
		if debug-state is false:
			say "Type any key to continue[if my-row < 4] or Q to quit[end if].";
			let Q be the chosen letter;
			if Q is 81 or Q is 113, break;
		else:
			say "Skipping push-key-to-continue nag in debug mode.";
	now in-tutorial is false;
	reset-guard;
	repeat with X running through pieces:
		now X is in offsite;
		now X is not tutorial-held;
	repeat with X running through pieces:
		if cached-position of X is not offsite, move X to cached-position of X;
		now cached-position of X is offsite;
	the rule succeeds.

table of tutorial stuff
queen-pos	rook-pos	king-pos	blather
a5	b4	b1	"Here the rook attacks the king, who has to move to the c-file."
c5	b4	c1	"Here the rook attacks the king, who has to move to the d-file."
c5	d4	d1	"Again the rook attacks the king, who has to move to the e-file."
e5	d4	e1	"The enemy king is trapped, since it can't move over. Maybe you can do the same with [if quest-index is 1]the two rooks[else]less material, but with the idea of pushing the enemy king against the edge."

chapter verbsing

carry out verbsing:
	say "The main verbs you can use are about going places. You have 8 different diagonal directions, which you can see in detail with [b]DIRS[r]. You can also specify the county you wish to visit by name, e.g. [b]c3[r] will send you back to the center.";
	say "You can also [b]C[r]/[b]CALL[r] or [b]P[r]/[b]PLACE[r] allies or the [5b]n king. You can often use abbreviations for the allies you need to place. These are all the commands you need to win.";
	say "[line break][b]X[r] [delenda] details your current quest, including useful shorthand to refer to your allies. You can also [b]FAIL[r]/[b]F[r] to reset the current quest.";
	say "[line break]But there are also meta-commands. Of these, [b]M[r] or [b]MAP[r] to see the map at any time is likely to be the most useful. It shows you where your allies are and what they are guarding. [b]B[r] or [b]BOARD[r] also works.";
	say "General meta-commands include [b]ABOUT[r]/[b]A[r] and [b]CREDITS[r]/[b]CR[r] for general game information and thanks.";
	say "You also have the option of toggling abbreviations of long directions with [b]ABB[r].";
	say "If you want a rules refresher, [b]CHESS[r] or [b]CH[r] will teach you all you need to know. Don't worry--you won't be quizzed on en passant!";
	if quest-index > 1:
		say "You can also [b]REVIEW[r] or [b]R[r] what you've done so far, though that's more for general chess endgame knowledge.";
	else if quest-index < 4:
		say "[b]TUT[r] provides a tutorial on how pieces move and how a queen and rook can trap the king, which may help you.";
	else:
		say "[b]T[r] toggles tour view for the quest between printing directions and printing a map.";
	say "And of course, there's this command, too: [verbs].";

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "On the very east side of the world lie such repositories of hooliganism and pointless chance-taking as Backgammonton, Pokersfield or, worse, Yahtzeeburg. You dream of helping conquer them one day, but it is only a dream. A too-risky one at that.";

volume game-specific parser error details

rule for printing a parser error:
	say "I didn't recognize that command. Type [verbs] to see the full list of commands. If you're confused what to do, [b]X[r] [delenda] again, or refer to the game [b]MAP[r]."

volume beta testing - not for release

when play begins:
	now in-beta is true;
	say "Beta testers have access to the commands TRY (1-4), to work on a particular quest, and WAYS. This text will not appear in the release, but if it does, that's my fault."

chapter trying

trying is an action applying to one number.

understand the command "try" as something new.

understand "try [number]" as trying.

carry out trying:
	if number understood < 1 or number understood > 4:
		say "You need a number between 1 and 4." instead;
	if quest-index is number understood:
		say "We're already on that quest, so we won't reset it. Just do it wrong to reset.";
		the rule succeeds;
	else:
		say "Moving to quest [number understood].";
	now quest-index is number understood;
	setup-next-puzzle;
	the rule succeeds.

volume testing - not for release

chapter stupid stuff

test q1f with "call rook/nnw/call rook/ssw/call king".
test q1 with "ssw/nnw/see/see/call kingside/nww/call queenside/sww/call king".
test q1s with "nnw/call kingside/ssw/see/call queenside/sww/call king".

test q2a with "see/place k/sww/place q/nne/sse/place k".
test q2f with "call queen/nnw/call king/ssw/call king".
test q2n with "ssw/nee/call queen/sww/nne/call king/sse/call king".
test q2 with "sse/call queen/nnw/ssw/nnw/call friendly king/sse/call enemy king".
test q2s with "nne/call friendly king/sww/sse/call queen/sww/call king".

test a2 with "test q1/test q2".

test q3f with "call rook/nnw/call king/ssw/call king".
test q3 with "sww/see/call rook/nnw/call friendly king/ssw/call enemy king".
test q3s with "sww/call rook/see/call friendly king/nne/sse/call enemy king".

test a3 with "test q1/test q2/test q3".

test q4f with "nnw/ssw/sse/nee/nne/nww/sww/sse/see/nne/nnw/sww/ssw/see/nee/nnw/sww/nnw/see/nee/sww". [fail but get very close]
test q4 with "nnw/ssw/sse/nee/nne/nww/sww/sse/see/nne/nnw/sww/ssw/see/nee/nnw/sww/nnw/see/nee/ssw/sse/nww/sww".

test win1 with "test q1/test q2/test q3/test q4".
test win2 with "test q1s/test q2s/test q3s/test q4".

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
