"Knight's Errand" by Andrew Schultz

volume basics and definitions

debug-state is a truth state that varies.

chapter room info

a room has a number called x. a room has a number called y.

offsite is a room.

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
			let re2n1 be room_of xval + 1 and yval + 2;
			let rn2e1 be room_of xval + 2 and yval + 1;
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

quest-index is a number that varies. quest-index is 0.

chapter calling

calling is an action applying to nothing.

understand the command "call" as something new.

understand "call" as calling.

carry out calling:
	if quest-index is 4, say "You're on your own now." instead;
	if number of reserved pieces is 0:
		consider the checkmate processing rule;
	if the rule failed, reset-the-board;
	if the rule succeeded:
		setup-next-puzzle;
	the rule succeeds.

to setup-next-puzzle:
	increment quest-index;
	repeat with P running through pieces:
		if entry quest-index of summon-list of P is true:
			now P is reserved;
		else:
			now P is irrelevant;

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

definition: a room (called r) is checked:
	if r is nowhere, yes;
	repeat with q running through on-stage pieces:
		next;
	no;
	yes;

definition: a room (called r) is surrounded:
	if the room north of r is not checked, no;
	if the room south of r is not checked, no;
	if the room east of r is not checked, no;
	if the room west of r is not checked, no;
	if the room northwest of r is not checked, no;
	if the room northeast of r is not checked, no;
	if the room southeast of r is not checked, no;
	if the room southwest of r is not checked, no;
	yes;

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
