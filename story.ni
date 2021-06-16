"Knight's Errand" by Andrew Schultz

debug-state is a truth state that varies.

a room has a number called x. a room has a number called y.

a1 is a room. x of a1 is 0. y of a1 is 0.

a2 is a room. x of a2 is 0. y of a2 is 1.

a3 is a room. x of a3 is 0. y of a3 is 2.

a4 is a room. x of a4 is 0. y of a4 is 3.

a5 is a room. x of a5 is 0. y of a5 is 4.

b1 is a room. x of b1 is 1. y of b1 is 0.

b2 is a room. x of b2 is 1. y of b2 is 1.

b3 is a room. x of b3 is 1. y of b3 is 2.

b4 is a room. x of b4 is 1. y of b4 is 3.

b5 is a room. x of b5 is 1. y of b5 is 4.

c1 is a room. x of c1 is 2. y of c1 is 0.

c2 is a room. x of c2 is 2. y of c2 is 1.

c3 is a room. x of c3 is 2. y of c3 is 2.

c4 is a room. x of c4 is 2. y of c4 is 3.

c5 is a room. x of c5 is 2. y of c5 is 4.

d1 is a room. x of d1 is 3. y of d1 is 0.

d2 is a room. x of d2 is 3. y of d2 is 1.

d3 is a room. x of d3 is 3. y of d3 is 2.

d4 is a room. x of d4 is 3. y of d4 is 3.

d5 is a room. x of d5 is 3. y of d5 is 4.

e1 is a room. x of e1 is 4. y of e1 is 0.

e2 is a room. x of e2 is 4. y of e2 is 1.

e3 is a room. x of e3 is 4. y of e3 is 2.

e4 is a room. x of e4 is 4. y of e4 is 3.

e5 is a room. x of e5 is 4. y of e5 is 4.

to decide which room is room_of (n1 - a number) and (n2 - a number):
	repeat with Q running through rooms:
		if x of Q is n1 and y of Q is n2:
			decide on Q;
	if debug-state is true:
		say "Could not find room for [n1] and [n2].";

when play begins:
	repeat with xval running from 0 to 3:
		repeat with yval running from 0 to 3:
			let r1 be room_of xval and yval;
			let r2 be room_of xval + 1 and yval;
			let r3 be room_of xval and yval + 1;
			now r1 is mapped west of r2;
			now r2 is mapped east of r1;
			now r3 is mapped north of r1;
			now r1 is mapped south of r3;
