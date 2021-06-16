"Knight's Errand" by Andrew Schultz

volume basics and definitions

debug-state is a truth state that varies.

chapter room info

a room has a number called x. a room has a number called y.

offsite is a room. x of offsite is -3. y of offsite is -3.

a room can be circle-visited. a room is usually not circle-visited.

chapter direction info

a direction can be normal or weird. a direction is usually normal.

southsoutheast is a direction. it is weird. northnorthwest is a direction. it is weird.

the opposite of southsoutheast is northnorthwest. the opposite of northnorthwest is southsoutheast.

understand "sse" and "ses" and "ess" as southsoutheast.

understand "nnw" and "nwn" and "wnn" as northnorthwest.

southeasteast is a direction. it is weird. northwestwest is a direction. it is weird.

the opposite of southeasteast is northwestwest. the opposite of northwestwest is southeasteast.

understand "see" and "ese" and "ees" as southeasteast.

understand "nww" and "wnw" and "wwn" as northwestwest.

southsouthwest is a direction. it is weird. northnortheast is a direction. it is weird.

the opposite of southsouthwest is northnortheast. the opposite of northnortheast is southsouthwest.

understand "ssw" and "sws" and "wss" as southsouthwest.

understand "nne" and "nen" and "enn" as northnortheast.

southwestwest is a direction. it is weird. northeasteast is a direction. it is weird.

the opposite of southwestwest is northeasteast. the opposite of northeasteast is southwestwest.

understand "sww" and "wsw" and "wws" as southwestwest.

understand "nee" and "ene" and "een" as northeasteast.

chapter direction verbs

volume rooms

a1 is a room. x of a1 is 0. y of a1 is 0.

b1 is a room. x of b1 is 1. y of b1 is 0.

c1 is a room. x of c1 is 2. y of c1 is 0.

d1 is a room. x of d1 is 3. y of d1 is 0.

e1 is a room. x of e1 is 4. y of e1 is 0.

a2 is a room. x of a2 is 0. y of a2 is 1.

b2 is a room. x of b2 is 1. y of b2 is 1.

c2 is a room. x of c2 is 2. y of c2 is 1.

d2 is a room. x of d2 is 3. y of d2 is 1.

e2 is a room. x of e2 is 4. y of e2 is 1.

a3 is a room. x of a3 is 0. y of a3 is 2.

b3 is a room. x of b3 is 1. y of b3 is 2.

c3 is a room. x of c3 is 2. y of c3 is 2.

d3 is a room. x of d3 is 3. y of d3 is 2.

e3 is a room. x of e3 is 4. y of e3 is 2.

a4 is a room. x of a4 is 0. y of a4 is 3.

b4 is a room. x of b4 is 1. y of b4 is 3.

c4 is a room. x of c4 is 2. y of c4 is 3.

d4 is a room. x of d4 is 3. y of d4 is 3.

e4 is a room. x of e4 is 4. y of e4 is 3.

d5 is a room. x of d5 is 3. y of d5 is 4.

a5 is a room. x of a5 is 0. y of a5 is 4.

b5 is a room. x of b5 is 1. y of b5 is 4.

c5 is a room. x of c5 is 2. y of c5 is 4.

e5 is a room. x of e5 is 4. y of e5 is 4.

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
	say "Your horse doesn't go in normal directions. It goes in diagonal ones. And not just southeast (SE). Southsoutheast (SSE, ESS, SES) and such." instead;

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

volume people

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

chapter calling

calling is an action applying to one visible thing.

understand the command "call" as something new.

understand "call [any piece]" as calling.

carry out calling:
	if quest-index is 4, say "You're on your own now." instead;
	if noun is placed:
		say "You already placed [the noun] at [location of the noun]." instead;
	if noun is irrelevant:
		say "Right now [the noun] is not part of your maneuver." instead;
	if number of pieces in location of player > 0:
		say "That would make things too crowded here. You already called [random piece in location of player] here." instead;
	say "You call [the noun] to [location of player].";
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
	move player to c3;

to reset-the-board:
	now all pieces are off-stage;
	now all placed pieces are reserved;

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

carry out statsing:
	say "Reserved pieces to (C)all: [list of reserved pieces].";
	say "Pieces out on the board: [list of placed pieces].";
	the rule succeeds.

after printing the name of a placed piece (called p) when statsing:
	say "[location of p]"

volume testing - not for release

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
