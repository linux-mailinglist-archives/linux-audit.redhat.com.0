Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DFDB01D3
	for <lists+linux-audit@lfdr.de>; Wed, 11 Sep 2019 18:41:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B8C3307D965;
	Wed, 11 Sep 2019 16:41:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB8445D9E2;
	Wed, 11 Sep 2019 16:41:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35A6E180221D;
	Wed, 11 Sep 2019 16:41:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8B3uUQx009875 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Sep 2019 23:56:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 370845C224; Wed, 11 Sep 2019 03:56:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A525C21E
	for <linux-audit@redhat.com>; Wed, 11 Sep 2019 03:56:27 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CDC0C08C33E
	for <linux-audit@redhat.com>; Wed, 11 Sep 2019 03:56:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 95CFA21947;
	Tue, 10 Sep 2019 23:56:19 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
	by compute3.internal (MEProxy); Tue, 10 Sep 2019 23:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	mime-version:message-id:date:from:to:cc:subject:content-type; s=
	fm1; bh=LU5xkNBgukgf3lnjcqhFI3FsWW0uDQMgZ7Kdjg40cOc=; b=nqDSYmOC
	jGEA7SIE2fHPsbrrwEURKucoekDWtauUWR7TC6OroNug8MuR2HL3e3dSq03NeY7d
	MVALqd/MY8kqse8rEzDvISsQn7lKOI/tttW90weLPQQNm9hula+Bw/o0dZUICTaF
	xBVAgqFF8poQ2mwsf3ibJl17o7lgUhlOzi/is+v1WtY3bPcZSsGd7lj803JbAp0I
	9kPJ3f6fj2rD4Hp5CIao0Gv1KVL5yrsI0PBEbX4Yyz2NfkJYDOxfmWEsUMgmsi7g
	UFYRambkZR0k0RbVbs6wg2IJWgcPLZDOGmRiOduZ9avju3LQe7oVOJ+wWH+5s0C7
	LdPQf1QvrFJq+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=LU5xkNBgukgf3lnjcqhFI3FsWW0uD
	QMgZ7Kdjg40cOc=; b=fBQwrBK/+TJA2bzqZSVYBrLTsrUA/gqhyY7/vn7uhWLcb
	qcY2qkmbl+8fUVO5IHG0QvK3DrkK4gfwtVOhrPRnTAaBrExkXnZq6HL3ExV5cTKe
	V6p4hVGU5HgFBMTbs6fUq/pq6IjMApKo/VCB3bsqKQ0r8SLUtIrpzjpUsJ12foCR
	AuocP6ONXMeig+rW5xgKTBfMsZt8j4iuFMqqAVVwWRbF8hwXNZv5dnazeRQEvReM
	VEl8bd3MtiaTBnh8MgxP1QMZ2F5ArBg8GzBhCTYmAYlLPcTfa97TMKLHihch5X7M
	YzVmeXegrL4A6QtJPs72jQeSjP5BExpXll90V7c1Q==
X-ME-Sender: <xms:YnB4XQHfeOOazlFDYe1dXYOmqxPLOrGNRpeMNuc7nOd2kIcNJHZX8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtddugdejjecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfffhffvufgtsehttdertderredtnecuhfhrohhmpedfifhiohhvrghn
	nhhiucfrrghnvghpihhnthhofdcuoehgphgrnhgvphhinhhtohesfhgrshhtmhgrihhlrd
	hfmheqnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfrrghrrghmpehmrghilhhf
	rhhomhepghhprghnvghpihhnthhosehfrghsthhmrghilhdrfhhmnecuvehluhhsthgvrh
	fuihiivgeptd
X-ME-Proxy: <xmx:YnB4XT8JPmfx2xcBeMh58rMSByM0v3kh8RxwTTouEgF9vh0BTozXwg>
	<xmx:YnB4XQJAbuviz38S_kx0SoPRrTqlnMg9HNcjLJt2BMukFDAGo5tG4Q>
	<xmx:YnB4XRsJUtJPNdwTTyuPbAKEMAjihZ-QxKw23Ygm9MNvpRuKcJcjjw>
	<xmx:Y3B4XR7flw46bI-CL-XxBUzyJLSWDSOLbviPkZazeH93FaB11sLrUw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 898623C00A1; Tue, 10 Sep 2019 23:56:18 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.1.7-227-g18586b54-fmstable-20190911v1
Mime-Version: 1.0
Message-Id: <bd4b2f99-89a0-4d59-aeb9-a97be31b0445@www.fastmail.com>
Date: Wed, 11 Sep 2019 03:55:58 +0000
From: "Giovanni Panepinto" <gpanepinto@fastmail.fm>
To: linux-audit@redhat.com
Subject: When is EOE generated?
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Wed, 11 Sep 2019 03:56:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 11 Sep 2019 03:56:23 +0000 (UTC) for IP:'66.111.4.29'
	DOMAIN:'out5-smtp.messagingengine.com'
	HELO:'out5-smtp.messagingengine.com'
	FROM:'gpanepinto@fastmail.fm' RCPT:''
X-RedHat-Spam-Score: -0.801  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 66.111.4.29 out5-smtp.messagingengine.com 66.111.4.29
	out5-smtp.messagingengine.com <gpanepinto@fastmail.fm>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 11 Sep 2019 12:38:49 -0400
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 11 Sep 2019 16:41:12 +0000 (UTC)

Hello all,

According to https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/security_guide/sec-audit_record_types , the record EOE gets generated to represent "the end of a multi-record event."

In my audit logs, I can see that for some events, EOE doesn't get generated.

Log sample:
type=SYSCALL msg=audit(1568174009.456:2069021): arch=c000003e syscall=2 success=yes exit=3 a0=7ffcaf5b3915 a1=941 a2=1b6 a3=7c9bd777 items=2 ppid=22527 pid=23323 auid=1012 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=6417 comm="touch" exe="/usr/bin/touch" key="usr_local_bin_change"
type=PATH msg=audit(1568174009.456:2069021): item=0 name="/usr/local/bin/" inode=12583209 dev=fe:00 mode=040755 ouid=0 ogid=0 rdev=00:00 nametype=PARENT
type=PATH msg=audit(1568174009.456:2069021): item=1 name="/usr/local/bin/myfile1" inode=12599538 dev=fe:00 mode=0100600 ouid=0 ogid=0 rdev=00:00 nametype=CREATE
type=UNKNOWN[1327] msg=audit(1568174009.456:2069021): proctitle=746F756368002F7573722F6C6F63616C2F62696E2F6D7966696C6531


Auditd version:
2.3.6

Following rule set:

-D
-b 4096
-w /etc/sudoers -p wa -k sysadmin-scope
-w /etc/sudoers.d -p wa -k sysadmin-scope
-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=500 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=500 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=500 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=500 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete
-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete
-w /sbin/insmod -p x -k modules
-w /sbin/rmmod -p x -k modules
-w /sbin/modprobe -p x -k modules
-a always,exit -F arch=b64 -S init_module -S delete_module -k modules
-w /var/log/faillog -p wa -k logins
-w /var/log/lastlog -p wa -k logins
-w /var/log/tallylog -p wa -k logins
-w /var/run/utmp -p wa -k session
-w /var/log/wtmp -p wa -k session
-w /var/log/btmp -p wa -k session
-a always,exit -F arch=b64 -S mount -F auid>=500 -F auid!=4294967295 -k mounts
-a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k mounts
-a always,exit -F arch=b64 -S umount2 -F auid>=500 -F auid!=4294967295 -k mounts
-a always,exit -F arch=b32 -S umount2 -F auid>=500 -F auid!=4294967295 -k mounts
-w /var/log/sudo.log -p wa -k sysadmin-actions
-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F path=/usr/lib/utempter/utempter -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/sudo -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/su -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/wall -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/write -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/mount -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/newgrp -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/at -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/passwd -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/umount -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/chage -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/chfn -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/chsh -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/expiry -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/gpasswd -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/crontab -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/sbin/postdrop -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/sbin/postqueue -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/lib/dbus-1/dbus-daemon-launch-helper -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/sbin/unix_chkpwd -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exit -F path=/sbin/mount.nfs -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged
-a always,exclude -F msgtype=CWD
-a always,exclude -F msgtype=CRYPTO_KEY_USER
-a never,exit -F dir=/sys/fs/cgroup
-a never,exit -F dir=/run/systemd/journal
-a never,exit -F uid=1002
-a never,exit -F uid=1003
-a never,exit -F uid=521
-a always,exit -F perm=w -F dir=/sbin -F arch=b64 -F success=1 -F key=sbin_write
-a always,exit -F perm=a -F dir=/sbin -F arch=b64 -F success=1 -F key=sbin_attribute_change
-a always,exit -F perm=a -F path=/var/log/messages -F arch=b64 -F success=1 -F key=var_log_messages_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/messages -F success=1 -F key=var_log_messages_delete
-a always,exit -F perm=w -F dir=/usr/sbin -F arch=b64 -F success=1 -F key=usr_sbin_write
-a always,exit -F perm=a -F dir=/usr/sbin -F arch=b64 -F success=1 -F key=usr_sbin_attribute_change
-a always,exit -F arch=b64 -S unlink  -F path=/etc/ssh/sshd_config -F success=1 -F key=sshd_config_delete
-a always,exit -F perm=wa -F path=/etc/ssh/sshd_config -F arch=b64 -F success=1 -F key=sshd_config_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/dmesg -F success=1 -F key=var_log_dmesg_delete
-a always,exit -F perm=a -F path=/var/log/dmesg -F arch=b64 -F success=1 -F key=var_log_dmesg_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/faillog -F success=1 -F key=var_log_faillog_delete
-a always,exit -F perm=a -F path=/var/log/faillog -F arch=b64 -F success=1 -F key=var_log_faillog_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/utmp -F success=1 -F key=var_log_utmp_delete
-a always,exit -F perm=a -F path=/var/log/utmp -F arch=b64 -F success=1 -F key=var_log_utmp_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/user.log -F success=1 -F key=var_log_user_delete
-a always,exit -F perm=a -F path=/var/log/user.log -F arch=b64 -F success=1 -F key=var_log_user_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/auth.log -F success=1 -F key=var_log_auth_delete
-a always,exit -F perm=a -F path=/var/log/auth.log -F arch=b64 -F success=1 -F key=var_log_auth_change
-a always,exit -F arch=b64 -S unlink  -F path=/etc/login.defs -F success=1 -F key=etc_logindefs_delete
-a always,exit -F perm=aw -F path=/etc/login.defs -F arch=b64 -F success=1 -F key=etc_logindefs_change
-a always,exit -F perm=w -F dir=/usr/bin -F arch=b64 -F success=1 -F key=usr_bin_write
-a always,exit -F perm=a -F dir=/usr/bin -F arch=b64 -F success=1 -F key=usr_bin_attribute_change
-a always,exit -F arch=b64 -S unlink  -F path=/etc/passwd -F success=1 -F key=etc_passwd_delete
-a always,exit -F perm=aw -F path=/etc/passwd -F arch=b64 -F success=1 -F key=etc_passwd_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/boot.log -F success=1 -F key=var_log_boot_delete
-a always,exit -F perm=a -F path=/var/log/boot.log -F arch=b64 -F success=1 -F key=var_log_boot_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/kern.log -F success=1 -F key=var_log_kernlog_delete
-a always,exit -F perm=a -F path=/var/log/kern.log -F arch=b64 -F success=1 -F key=var_log_kernlog_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/btmp -F success=1 -F key=var_log_btmp_delete
-a always,exit -F perm=a -F path=/var/log/btmp -F arch=b64 -F success=1 -F key=var_log_btmp_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/wtmp -F success=1 -F key=var_log_wtmp_delete
-a always,exit -F perm=a -F path=/var/log/wtmp -F arch=b64 -F success=1 -F key=var_log_wtmp_change
-a always,exit -F arch=b64 -S unlink  -F path=/etc/pam.d/common-password -F success=1 -F key=etc_pam_commonpassword_delete
-a always,exit -F perm=aw -F path=/etc/pam.d/common-password -F arch=b64 -F success=1 -F key=etc_pam_commonpassword_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/syslog -F success=1 -F key=var_log_syslog_delete
-a always,exit -F perm=a -F path=/var/log/syslog -F arch=b64 -F success=1 -F key=var_log_syslog_change
-a always,exit -F perm=aw -F dir=/boot -F arch=b64 -F success=1 -F key=boot_change
-a always,exit -F arch=b64 -S unlink  -F path=/etc/sudoers -F success=1 -F key=etc_sudoers_delete
-a always,exit -F perm=aw -F path=/etc/sudoers -F arch=b64 -F success=1 -F key=etc_sudoers_change
-a always,exit -F arch=b64 -S unlink  -F path=/etc/sudoers -F success=1 -F key=etc_shadow_delete
-a always,exit -F perm=aw -F path=/etc/shadow -F arch=b64 -F success=1 -F key=etc_shadow_change
-a always,exit -F perm=aw -F dir=/usr/local/bin -F arch=b64 -F success=1 -F key=usr_local_bin_change
-a always,exit -F arch=b64 -S unlink  -F path=/var/log/cron -F success=1 -F key=var_log_cron_delete
-a always,exit -F perm=a -F path=/var/log/cron -F arch=b64 -F success=1 -F key=var_log_cron_change
-a always,exit -F perm=aw -F dir=/bin -F arch=b64 -F success=1 -F key=bin_change
-a always,exit -F perm=w -F dir=/usr/local/sbin -F arch=b64 -F success=1 -F key=usr_local_sbin_write
-a always,exit -F perm=a -F dir=/usr/local/sbin -F arch=b64 -F success=1 -F key=usr_local_sbin_attribute_change
-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change
-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change
-a always,exit -F arch=b64 -S clock_settime -k time-change
-a always,exit -F arch=b32 -S clock_settime -k time-change
-w /etc/localtime -p wa -k time-change
-w /etc/apparmor -p wa -k MAC-policy
-w /etc/selinux -p wa -k MAC-policy
-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale
-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale
-w /etc/hosts -p wa -k system-locale
-w /etc/sysconfig/network -p wa -k system-locale
-w /etc/group -p wa -k identity
-w /etc/passwd -p wa -k identity
-w /etc/gshadow -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /etc/security/opasswd -p wa -k identity

So my question is, what defines a multi-record event? And why is EOE not generated when I create a file under /usr/local/bin?

-- 
Kind Regards,
Giovanni

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
