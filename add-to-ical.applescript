(*
	script for forcing a calendar add, allows for manual adding to calendars
*)

tell application "Mail"
	set theSelectedMessages to selection
	repeat with theMessage in theSelectedMessages
		set theAttachment to first item of theMessage's mail attachments
		set theAttachmentFileName to "Macintosh HD:tmp:" & (theMessage's id as string) & ".ics"
		set theSender to theMessage's sender
		save theAttachment in file theAttachmentFileName
		do shell script "fn='/tmp/$RANDOM.ics';cat " & quoted form of POSIX path of theAttachmentFileName & "| grep -v METHOD:REQUEST > $fn;open $fn; exit 0;"
				--rm " & quoted form of POSIX path of theAttachmentFileName & "; exit 0;"
		
		--set text item delimiters to "BEGIN:VEVENT"
		--set theEvents to text items of theAttachment
		--set text item delimiters to "END:VEVENT"
		--set allEvents to {}
		--repeat with i from 2 to count of theEvents
		--	set theEvent to item i of theEvents
		--	set trimmedEvent to text item 1 of theEvent
		--	set end of allEvents to rich text 2 thru -2 of trimmedEvent -- you can do something here instead of collecting them in the list
		--end repeat
		--set text item delimiters to ""
		--return allEvents
		--set theOutgoingMessage to reply thisMessage with opening window
		set theNewMessage to make new outgoing message with properties {visible:true, subject:"Testing Reply", content:do shell script " cat " & quoted form of POSIX path of theAttachmentFileName & " | sed /^.*END:.*$/d | sed /^.*MICROSOFT.*$/d  | sed /^TZ.*$/d | sed /^BEGIN:.*$/d | sed /^VERSION:.*$/d | sed /^DT:.*$/d | sed /^TRANSP:.*$/d | sed /^SEQUENCE:.*$/d | sed /^RRULE:.*$/d | sed /^DTSTART:16010101T020000.*$/d | sed 's/;/\\" & linefeed & "/g' | sed s/^TZID=//g  | sed s/^.*MAILTO/MAILTO/g | sed s/^CN=.*//g | sed /^$/d | sed 's/ORGANIZER/\\" & linefeed & "ORGANIZER/g' | sed 's/ATTENDEE/\\" & linefeed & "ATTENDEE/g' | sed 's/SUMMARY/\\" & linefeed & "SUMMARY/g' | sed s/LANGUAGE=en-US://g | sed 's/DTSTART/\\" & linefeed & "DTSTART/g'"}
		
		tell theNewMessage to make new to recipient at end of every to recipient with properties {address:theSender}
		tell theNewMessage to make new attachment with properties {file name:theAttachmentFileName as alias}
		
	end repeat
end tell

--| sed /^$/d
--| sed \"s/:/\\" & linefeed & "  /g\"