trigger updatecontact on Account (before insert) {
	system.debug('This is Sample');
}