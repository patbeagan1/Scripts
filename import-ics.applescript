(*
	Script for automatically extracting calendar items from meeting requests
	and adding them into iCal.
*)


using terms from application "Mail"
	
	on perform mail action with messages theMessages
		tell application "Mail"
			repeat with theMessage in theMessages
				set theSource to the source of theMessage
				(* Find the range of the message source that is an ics message 
				   Note: this works both on messages that detect the .ics attachement,
						and on crappy Exchange invites that show up as an owa url. *)
				set vcalBegin to the offset of "BEGIN:VCALENDAR" in theSource
				set vcalEnd to (the offset of "END:VCALENDAR" in theSource) + (the length of "END:VCALENDAR")
				(* Get the ics data *)
				set theInvite to the text vcalBegin thru vcalEnd of theSource
				(* Only deal with requests *)
				if (the offset of "METHOD:REQUEST" in theInvite) is equal to 0 then
					(* do nothing *)
				else
					(* path to which to save the tmp file.  This may need to be changed,  AppleScript's handling of paths leaves much to be desired *)
					set thePath to "/tmp/temp_invite.ics" as POSIX file
					
					(* write to a temp file *)
					set theTmpfile to open for access thePath with write permission
					set eof theTmpfile to 0
					set theDummy to theInvite as text
					write theDummy & return to theTmpfile
					close access theTmpfile
					(* open in iCal *)
					tell application "iCal" to open the thePath
					(* delete the file *)
					tell application "Finder" to delete the thePath
				end if
				
			end repeat
		end tell
	end perform mail action with messages
end using terms from
