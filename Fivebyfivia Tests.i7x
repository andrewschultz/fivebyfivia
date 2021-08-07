Version 1/210807 of Fivebyfivia Tests by Andrew Schultz begins here.

"Tests for Fivebyfivia."

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
	repeat with Q running through knightly directions:
		say "[Q] [the room Q of location of player].";
	repeat with Q running through { north, south, east, west }:
		say "[Q] [the room Q of location of player].";
	the rule succeeds.

Fivebyfivia Tests ends here.

---- DOCUMENTATION ----
