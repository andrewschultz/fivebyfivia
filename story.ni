"Conquering Fivebyfivia" by Andrew Schultz

volume basics and definitions

debug-state is a truth state that varies.

chapter i6

To say character number (N - a number): (- print (char) {N}; -)

chapter room info

a room has a number called x. a room has a number called y.

a room has text called room-edge-text.

offsite is a room. x of offsite is -3. y of offsite is -3.

the description of a room is usually "[room-color]. You're [room-edge-text of the item described] of Fivebyfivia.[paragraph break][room-detail].".

to say room-color:
	say "The ground is [if the remainder after dividing (x of location of player + y of location of player) by 2 is 0]light[else]dark[end if]er than normal here"

to say room-detail:
	if location of player is c3:
		say "From here, your horse can bolt in any of the crazy directions it likes to zoom off. Hooray, freedom! Well, for you, not for Fivebyfivia";
		continue the action;
	say "You can go [list of viable directions]";

definition: a direction (called d) is viable:
	if d is normal, no;
	if the room d of location of player is offsite, no;
	if the room d of location of player is nowhere, no;
	yes;

section going nowhere

check going nowhere:
	say "Your trusty steed won't budge. You grumble for a bit, then realize Fivebyfivia has no [file of noun][square of noun] area. What a piffly country! They should've been taken over long before this. They should feel LUCKY a country as swell as Twelvebytwelvia is plotting to take them over.[paragraph break]Anyway. Another direction, perhaps." instead;

to say file of (d - a direction):
	let d2 be xness of d + x of location of player;
	if d2 < 0:
		say "[character number 123 + d2]";
	else:
		say "[character number 97 + d2]";

to decide which number is square of (d - a direction):
	decide on 1 + y of location of player + yness of d.

section timed-going

after going when need-to-hurry is true:
	increment current-max-wait;
	if this-quest-wait > current-max-wait:
		if enemy king is placed:
			say "You hear a noise and look around. The enemy king, disgusted at having his time wasted without meeting anyone, retreats. Perhaps he suspects something. Perhaps he does not.";
		else:
			say "You hear familiar moans. Your summoned compatriot [if number of placed pieces > 1]s have[else]has[end if] grown impatient. The whole operation was based on stealth, which you did not have this time.";
		say "[line break]You have failed in your quest, and your king and queen will not be pleased ... unless we pretend this was just a practice run you planned in your head before the real thing. Yes, yes, let's do that. That's how it is.";
		reset-the-board;

section circle-visited

a room can be circle-visited. a room is usually not circle-visited.

after going to a circle-visited room:
	say "A groan goes up. You've been here before. Your triumphant tour is cut short.";
	reset-the-board;

chapter direction info

a direction can be normal or weird. a direction is usually normal.

a direction has a number called yness. yness of a direction is usually 0.

a direction has a number called xness. xness of a direction is usually 0.

southsoutheast is a direction. it is weird. northnorthwest is a direction. it is weird.

xness of southsoutheast is 1. yness of southsoutheast is -2. xness of northnorthwest is -1. yness of northnorthwest is 2.

the opposite of southsoutheast is northnorthwest. the opposite of northnorthwest is southsoutheast.

understand "sse" and "ses" and "ess" as southsoutheast.

understand "nnw" and "nwn" and "wnn" as northnorthwest.

southeasteast is a direction. it is weird. northwestwest is a direction. it is weird.

xness of southeasteast is 2. yness of southeasteast is -1. xness of northwestwest is -2. yness of northwestwest is 1.

the opposite of southeasteast is northwestwest. the opposite of northwestwest is southeasteast.

understand "see" and "ese" and "ees" as southeasteast.

understand "nww" and "wnw" and "wwn" as northwestwest.

southsouthwest is a direction. it is weird. northnortheast is a direction. it is weird.

xness of southsouthwest is -1. yness of southsouthwest is -2. xness of northnortheast is 1. yness of northnortheast is 2.

the opposite of southsouthwest is northnortheast. the opposite of northnortheast is southsouthwest.

understand "ssw" and "sws" and "wss" as southsouthwest.

understand "nne" and "nen" and "enn" as northnortheast.

southwestwest is a direction. it is weird. northeasteast is a direction. it is weird.

xness of southwestwest is -2. yness of southwestwest is -1. xness of northeasteast is 2. yness of northeasteast is 1.

the opposite of southwestwest is northeasteast. the opposite of northeasteast is southwestwest.

understand "sww" and "wsw" and "wws" as southwestwest.

understand "nee" and "ene" and "een" as northeasteast.

section for posterity

xness of north is 0. yness of north is 1. xness of south is 0. yness of south is -1. xness of east is 1. yness of east is 0. xness of west is -1. yness of west is 0. xness of northwest is -1. yness of northwest is 1. xness of northeast is 1. yness of northeast is 1. xness of southwest is -1. yness of southwest is -1. xness of southeast is 1. yness of southeast is -1.

chapter direction verbs

volume rooms

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

a4 is a room. x of a4 is 0. y of a4 is 3. room-edge-text is "on the west edge and near the south edge".

b4 is a room. x of b4 is 1. y of b4 is 3. room-edge-text is "in a southeast-ish area".

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
	say "Your horse doesn't go in normal directions. It goes in diagonal ones. But not normal ones like southeast (SE). Southsoutheast (SSE, ESS, SES) and, well, 7 others. DIRS gives a full rundown." instead;

volume initialization

when play begins:
	repeat with xval running from 0 to 3:
		repeat with yval running from 0 to 3:
			let r0 be room_of xval and yval;
			let re1 be room_of xval + 1 and yval;
			let rn1 be room_of xval and yval + 1;
			if r0 is offsite, next; [ shouldn't happen, but ... ]
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

a piece is a kind of person. a piece can be reserved, irrelevant, or placed. a piece is usually irrelevant. a piece has a list of truth state called summon-list.

the friendly king is a piece. understand "k" and "k1" as friendly king.

summon-list of friendly king is { false, true, true, false }.

the enemy king is a piece. understand "k" and "k2" as enemy king.

summon-list of enemy king is { true, true, true, false }.

the queen is a female piece.

summon-list of queen is { false, true, false, false }.

the kingside rook is a neuter piece.

summon-list of kingside rook is { true, false, true, false }.

the queenside rook is a neuter piece.

summon-list of queenside rook is { true, false, false, false }.

quest-index is a number that varies. quest-index is 1.

max-wait-times is a list of numbers variable. max-wait-times is { 2, 3, 2, 0 }.

chapter calling

calling is an action applying to one visible thing.

understand the command "call" as something new.
understand the command "place" as something new.

understand "call [any piece]" as calling.
understand "place [any piece]" as calling.

carry out calling:
	if quest-index is 4, say "You're on your own now." instead;
	if noun is placed:
		say "You already placed [the noun] at [location of the noun]." instead;
	if noun is irrelevant:
		say "Right now [the noun] is not part of your maneuver." instead;
	if number of pieces in location of player > 0:
		say "That would make things too crowded here. You already called [random piece in location of player] here." instead;
	say "You call [the noun] to [location of player].";
	now need-to-hurry is false;
	now noun is placed;
	move noun to location of player;
	if number of reserved pieces is 0:
		consider the checkmate processing rule;
	if the rule failed, reset-the-board;
	if the rule succeeded:
		increment quest-index;
		setup-next-puzzle;
	the rule succeeds.

after printing the locale description when quest-index is 4:
	now location of player is circle-visited;
	say "[number of circle-visited rooms] vs [number of not circle-visited rooms].";
	if number of not circle-visited rooms < 5:
		say "[list of not circle-visited rooms].";
	if number of circle-visited rooms is 25:
		say "You win! Sort of.";
		end the story;

does the player mean calling a reserved piece: it is very likely.

to setup-next-puzzle:
	reset-the-board;
	repeat with P running through pieces:
		if entry quest-index of summon-list of P is true:
			now P is reserved;
		else:
			now P is irrelevant;

current-max-wait is a number that varies.

this-quest-wait is a number that varies.

need-to-hurry is a truth state that varies.

to reset-the-board:
	if location of player is not c3:
		move player to c3;
	now all pieces are off-stage;
	now all placed pieces are reserved;
	if quest-index is 4:
		now all rooms are not circle-visited;
	now current-max-wait is entry quest-index of max-wait-times;
	now this-quest-wait is 0;
	now need-to-hurry is false.

this is the checkmate processing rule:
	let b1 be whether or not the location of the enemy king is checked;
	let b2 be whether or not the location of the enemy king is surrounded;
	if b1 is false:
		if b2 is true:
			say "Stalemate!";
		else:
			say "The enemy king looks around and flees, unharmed.";
		the rule fails;
	if b2 is false:
		say "The enemy king looks around, panicked. He realizes he's in a bit of trouble, but he manages to flee.";
		the rule fails;
	say "The enemy king looks around, then runs one way, then another. Slowly it dawns on him. He is trapped! The end is not pretty.";
	the rule succeeds;

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
			if xdelt > 1 or ydelt > 1, yes;
			next;
		if q is kingside rook or q is queenside rook:
			if xdelt > 0 or ydelt > 0, yes;
			next;
		if q is queen:
			if xdelt is 0 or ydelt is 0, next;
			if absval of xdelt is absval of ydelt, next;
			no;
		next;
	no;
	yes;

definition: a room (called r) is surrounded:
	repeat with D running through not weird directions:
		if the room D of r is nothing, next;
		if the room north of r is checked, next;
		no;
	yes;

volume status

chapter statsing

statsing is an action applying to nothing.

understand the command "stats" as something new.

understand "stats" as statsing.

to say vis of (r - a room):
	say " [if location of player is r]+[else if r is circle-visited]*[else] [end if]";

carry out statsing:
	if quest-index is 4:
		say "VISITED SO FAR:[line break]";
		say "[fixed letter spacing]   a b c d e[line break]";
		say "5[vis of a5][vis of b5][vis of c5][vis of d5][vis of e5] 5[line break]";
		say "4[vis of a4][vis of b4][vis of c4][vis of d4][vis of e4] 4[line break]";
		say "3[vis of a3][vis of b3][vis of c3][vis of d3][vis of e3] 3[line break]";
		say "2[vis of a2][vis of b2][vis of c2][vis of d2][vis of e2] 2[line break]";
		say "1[vis of a1][vis of b1][vis of c1][vis of d1][vis of e1] 1[line break]";
		say "   a b c d e[variable letter spacing][line break]";
		say "Visited so far: [number of circle-visited rooms] square[if location of player is not c3]s[end if].";
	say "Reserved pieces to (C)all: [list of reserved pieces].";
	say "Pieces out on the board: [list of placed pieces].";
	the rule succeeds.

after printing the name of a placed piece (called p) when statsing:
	say "[location of p]"

volume testing - not for release

when play begins:
	now debug-state is true;

chapter stupid stuff

test q1 with "ssw/nnw/see/see/call kingside/nww/call queenside/sww/call king".
test q2 with "sse/call queen/nnw/ssw/call friendly king/nnw/call enemy king".
test q3 with "sww/see/call rook/nnw/call friendly king/ssw/call enemy king".
test q4 with "nnw/ssw/sse/nee/nne/nww/sww/sse/see/nne/nnw/sww/ssw/see/nee/nnw/sww/nnw/see/nee/ssw/sse/nww/sww".

test full with "test q1/test q2/test q3/test q4".

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
