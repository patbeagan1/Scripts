FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � �
	Script for automatically extracting calendar items from meeting requests
	and adding them into iCal.
	
	Extracts calendar files from the text of all emails in Mail
	
     � 	 	P 
 	 S c r i p t   f o r   a u t o m a t i c a l l y   e x t r a c t i n g   c a l e n d a r   i t e m s   f r o m   m e e t i n g   r e q u e s t s 
 	 a n d   a d d i n g   t h e m   i n t o   i C a l . 
 	 
 	 E x t r a c t s   c a l e n d a r   f i l e s   f r o m   t h e   t e x t   o f   a l l   e m a i l s   i n   M a i l 
 	 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��     ��  w          k             l     ��������  ��  ��     ��  i         I     �� ��
�� .emalcpmanull���     ****  o      ���� 0 themessages theMessages��    O     �    X    � ��   k    �       r         l    !���� ! n     " # " 1    ��
�� 
raso # o    ���� 0 
themessage 
theMessage��  ��     o      ���� 0 	thesource 	theSource   $ % $ l    �� & '��   & � � Find the range of the message source that is an ics message 
				   Note: this works both on messages that detect the .ics attachement,
						and on crappy Exchange invites that show up as an owa url.     ' � ( (�   F i n d   t h e   r a n g e   o f   t h e   m e s s a g e   s o u r c e   t h a t   i s   a n   i c s   m e s s a g e   
 	 	 	 	       N o t e :   t h i s   w o r k s   b o t h   o n   m e s s a g e s   t h a t   d e t e c t   t h e   . i c s   a t t a c h e m e n t , 
 	 	 	 	 	 	 a n d   o n   c r a p p y   E x c h a n g e   i n v i t e s   t h a t   s h o w   u p   a s   a n   o w a   u r l .   %  ) * ) r    % + , + l   # -���� - I   #���� .
�� .sysooffslong    ��� null��   . �� / 0
�� 
psof / m     1 1 � 2 2  B E G I N : V C A L E N D A R 0 �� 3��
�� 
psin 3 o    ���� 0 	thesource 	theSource��  ��  ��   , o      ���� 0 	vcalbegin 	vcalBegin *  4 5 4 r   & 5 6 7 6 [   & 3 8 9 8 l  & / :���� : l  & / ;���� ; I  & /���� <
�� .sysooffslong    ��� null��   < �� = >
�� 
psof = m   ( ) ? ? � @ @  E N D : V C A L E N D A R > �� A��
�� 
psin A o   * +���� 0 	thesource 	theSource��  ��  ��  ��  ��   9 l  / 2 B���� B l  / 2 C���� C n   / 2 D E D 1   0 2��
�� 
leng E m   / 0 F F � G G  E N D : V C A L E N D A R��  ��  ��  ��   7 o      ���� 0 vcalend vcalEnd 5  H I H l   6 6�� J K��   J   Get the ics data     K � L L $   G e t   t h e   i c s   d a t a   I  M N M r   6 C O P O l  6 A Q���� Q n   6 A R S R 7  7 A�� T U
�� 
ctxt T o   ; =���� 0 	vcalbegin 	vcalBegin U o   > @���� 0 vcalend vcalEnd S o   6 7���� 0 	thesource 	theSource��  ��   P o      ���� 0 	theinvite 	theInvite N  V W V l   D D�� X Y��   X   Only deal with requests     Y � Z Z 2   O n l y   d e a l   w i t h   r e q u e s t s   W  [ \ [ Z   D � ] ^�� _ ] =  D O ` a ` l  D M b���� b l  D M c���� c I  D M���� d
�� .sysooffslong    ��� null��   d �� e f
�� 
psof e m   F G g g � h h  M E T H O D : R E Q U E S T f �� i��
�� 
psin i o   H I���� 0 	theinvite 	theInvite��  ��  ��  ��  ��   a m   M N����   ^ l   R R�� j k��   j   do nothing     k � l l    d o   n o t h i n g  ��   _ k   V � m m  n o n l   V V�� p q��   p � ~ path to which to save the tmp file.  This may need to be changed,  AppleScript's handling of paths leaves much to be desired     q � r r �   p a t h   t o   w h i c h   t o   s a v e   t h e   t m p   f i l e .     T h i s   m a y   n e e d   t o   b e   c h a n g e d ,     A p p l e S c r i p t ' s   h a n d l i n g   o f   p a t h s   l e a v e s   m u c h   t o   b e   d e s i r e d   o  s t s r   V ] u v u c   V [ w x w m   V W y y � z z ( / t m p / t e m p _ i n v i t e . i c s x m   W Z��
�� 
psxf v o      ���� 0 thepath thePath t  { | { l  ^ ^��������  ��  ��   |  } ~ } l   ^ ^��  ���      write to a temp file     � � � � ,   w r i t e   t o   a   t e m p   f i l e   ~  � � � r   ^ i � � � I  ^ g�� � �
�� .rdwropenshor       file � o   ^ _���� 0 thepath thePath � �� ���
�� 
perm � m   b c��
�� boovtrue��   � o      ���� 0 
thetmpfile 
theTmpfile �  � � � I  j s�� � �
�� .rdwrseofnull���     **** � o   j k���� 0 
thetmpfile 
theTmpfile � �� ���
�� 
set2 � m   n o����  ��   �  � � � r   t y � � � c   t w � � � o   t u���� 0 	theinvite 	theInvite � m   u v��
�� 
ctxt � o      ���� 0 thedummy theDummy �  � � � I  z ��� � �
�� .rdwrwritnull���     **** � b   z  � � � o   z {���� 0 thedummy theDummy � o   { ~��
�� 
ret  � �� ���
�� 
refn � o   � ����� 0 
thetmpfile 
theTmpfile��   �  � � � I  � ��� ���
�� .rdwrclosnull���     **** � o   � ����� 0 
thetmpfile 
theTmpfile��   �  � � � l   � ��� � ���   �   open in iCal     � � � �    o p e n   i n   i C a l   �  � � � O  � � � � � I  � ��� ���
�� .aevtodocnull  �    alis � l  � � ����� � o   � ����� 0 thepath thePath��  ��  ��   � m   � � � ��                                                                                  wrbt  alis    �  Macintosh HD               �w��H+   M}Calendar.app                                                    M��I
�        ����  	                Mail and Calendars    �w��      �IB�     M}   �  ;Macintosh HD:Applications: Mail and Calendars: Calendar.app     C a l e n d a r . a p p    M a c i n t o s h   H D  ,Applications/Mail and Calendars/Calendar.app  / ��   �  � � � l   � ��� � ���   �   delete the file     � � � � "   d e l e t e   t h e   f i l e   �  ��� � O  � � � � � I  � ��� ���
�� .coredeloobj        obj  � l  � � ����� � o   � ����� 0 thepath thePath��  ��  ��   � m   � � � ��                                                                                  MACS  alis    t  Macintosh HD               �w��H+     1
Finder.app                                                      W��u��        ����  	                CoreServices    �w��      �v,�       1   %   $  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��   \  ��� � l  � ���������  ��  ��  ��  �� 0 
themessage 
theMessage  o    ���� 0 themessages theMessages  m      � ��                                                                                  emal  alis    F  Macintosh HD               �w��H+     �Mail.app                                                        ��y�.        ����  	                Applications    �w��      �zn       �  #Macintosh HD:Applications: Mail.app     M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  ��   �                                                                                  emal  alis    F  Macintosh HD               �w��H+     �Mail.app                                                        ��y�.        ����  	                Applications    �w��      �zn       �  #Macintosh HD:Applications: Mail.app     M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  ��       �� � ���   � ��
�� .emalcpmanull���     **** � �� ���� � ���
�� .emalcpmanull���     ****�� 0 themessages theMessages��   � 	����������~�}�|�{�� 0 themessages theMessages�� 0 
themessage 
theMessage�� 0 	thesource 	theSource�� 0 	vcalbegin 	vcalBegin� 0 vcalend vcalEnd�~ 0 	theinvite 	theInvite�} 0 thepath thePath�| 0 
thetmpfile 
theTmpfile�{ 0 thedummy theDummy �  ��z�y�x�w�v 1�u�t�s ? F�r�q g y�p�o�n�m�l�k�j�i�h ��g ��f
�z 
kocl
�y 
cobj
�x .corecnte****       ****
�w 
raso
�v 
psof
�u 
psin�t 
�s .sysooffslong    ��� null
�r 
leng
�q 
ctxt
�p 
psxf
�o 
perm
�n .rdwropenshor       file
�m 
set2
�l .rdwrseofnull���     ****
�k 
ret 
�j 
refn
�i .rdwrwritnull���     ****
�h .rdwrclosnull���     ****
�g .aevtodocnull  �    alis
�f .coredeloobj        obj �� �� � ��[��l kh ��,E�O*���� 	E�O*���� 	��,E�O�[�\[Z�\Z�2E�O*���� 	j  hY S�a &E�O�a el E�O�a jl O��&E�O�_ %a �l O�j Oa  �j UOa  �j UOP[OY�eU ascr  ��ޭ