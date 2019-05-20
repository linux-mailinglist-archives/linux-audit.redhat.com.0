Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F6C241A1
	for <lists+linux-audit@lfdr.de>; Mon, 20 May 2019 22:02:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 935BA308218D;
	Mon, 20 May 2019 20:01:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCE64600CC;
	Mon, 20 May 2019 20:01:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F24D1806B15;
	Mon, 20 May 2019 20:00:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KJxeTV022783 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 15:59:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51B7346479; Mon, 20 May 2019 19:59:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-201.rdu2.redhat.com [10.10.122.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5CF77A429;
	Mon, 20 May 2019 19:59:36 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: useradd question
Date: Mon, 20 May 2019 15:59:30 -0400
Message-ID: <2786293.P8e7BSF5A5@x2>
Organization: Red Hat
In-Reply-To: <50add8c3-88c7-5f67-5ece-39fd92f1e646@magitekltd.com>
References: <d3d7fc57-c368-9d01-aae5-cb5469cd2334@magitekltd.com>
	<1666978.mmmlVrCjaM@x2>
	<50add8c3-88c7-5f67-5ece-39fd92f1e646@magitekltd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 20 May 2019 20:01:59 +0000 (UTC)

On Monday, May 20, 2019 11:39:09 AM EDT Lenny Bruzenak wrote:
> On 5/17/19 7:44 AM, Steve Grubb wrote:
> > On Thursday, May 16, 2019 7:00:38 PM EDT Lenny Bruzenak wrote:
> >> If I add a new user with the "useradd" utility, it submits a ADD_USER
> >> event, but the event itself has no interpretation for the new UID.
> > 
> > What exactly was typed in at the command line?
> 
> # useradd -c iam2 -G issm iam2
> 
> > This is caused by this line of
> > code:
> > 
> > https://github.com/linux-audit/audit-userspace/blob/master/lib/
> > audit_logging.c#L480
> > 
> > The idea is that we want to rely on the number rather than the name.
> > However, the log event is supposed to be created after passwd and shadow
> > have been updated. So, the audit daemon should be able to resolve the
> > event.
> > 
> > Maybe useradd needs to be straced to see if it does everything in one
> > shot or if it sends multiple events as it builds the user.
> 
> I think it is adding the events independently IIUC what the strace
> results say. Starting with the audit_open getting the netlink socket:
> 
> ...
> 
> socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) = 3
> sendto(3, "t\0\0\0\\\4\5\0\1\0\0\0\0\0\0\0op=add-group acc"..., 116, 0,
> {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 116
> recvfrom(3,
> "$\0\0\0\2\0\0\0\1\0\0\0006]\0\0\0\0\0\0t\0\0\0\\\4\5\0\1\0\0\0"...,
> 8988, MSG_PEEK|MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0,
> groups=00000000}, [12]) = 36
> recvfrom(3,
> "$\0\0\0\2\0\0\0\1\0\0\0006]\0\0\0\0\0\0t\0\0\0\\\4\5\0\1\0\0\0"...,
> 8988, MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0, groups=00000000},
> [12]) = 36
> sendto(3, "p\0\0\0Z\4\5\0\2\0\0\0\0\0\0\0op=add-user id=1"..., 112, 0,
> {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 112
> recvfrom(3,
> "$\0\0\0\2\0\0\0\2\0\0\0006]\0\0\0\0\0\0p\0\0\0Z\4\5\0\2\0\0\0"...,
> 8988, MSG_PEEK|MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0,
> groups=00000000}, [12]) = 36
> recvfrom(3,
> "$\0\0\0\2\0\0\0\2\0\0\0006]\0\0\0\0\0\0p\0\0\0Z\4\5\0\2\0\0\0"...,
> 8988, MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0, groups=00000000},
> [12]) = 36
> sendto(3, "\210\0\0\0N\4\5\0\3\0\0\0\0\0\0\0op=add-user-to-g"..., 136,
> 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 136
> recvfrom(3,
> "$\0\0\0\2\0\0\0\3\0\0\0006]\0\0\0\0\0\0\210\0\0\0N\4\5\0\3\0\0\0"...,
> 8988, MSG_PEEK|MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0,
> groups=00000000}, [12]) = 36
> recvfrom(3,
> "$\0\0\0\2\0\0\0\3\0\0\0006]\0\0\0\0\0\0\210\0\0\0N\4\5\0\3\0\0\0"...,
> 8988, MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0, groups=00000000},
> [12]) = 36
> sendto(3, "\210\0\0\0N\4\5\0\4\0\0\0\0\0\0\0op=add-to-shadow"..., 136,
> 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 136
> recvfrom(3,
> "$\0\0\0\2\0\0\0\4\0\0\0006]\0\0\0\0\0\0\210\0\0\0N\4\5\0\4\0\0\0"...,
> 8988, MSG_PEEK|MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0,
> groups=00000000}, [12]) = 36
> recvfrom(3,
> "$\0\0\0\2\0\0\0\4\0\0\0006]\0\0\0\0\0\0\210\0\0\0N\4\5\0\4\0\0\0"...,
> 8988, MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0, groups=00000000},
> [12]) = 36
> sendto(3, "t\0\0\0N\4\5\0\5\0\0\0\0\0\0\0op=add-home-dir "..., 116, 0,
> {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 116
> recvfrom(3,
> "$\0\0\0\2\0\0\0\5\0\0\0006]\0\0\0\0\0\0t\0\0\0N\4\5\0\5\0\0\0"...,
> 8988, MSG_PEEK|MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0,
> groups=00000000}, [12]) = 36
> recvfrom(3,
> "$\0\0\0\2\0\0\0\5\0\0\0006]\0\0\0\0\0\0t\0\0\0N\4\5\0\5\0\0\0"...,
> 8988, MSG_DONTWAIT, {sa_family=AF_NETLINK, pid=0, groups=00000000},
> [12]) = 36
> 
> That's all the FD 3 activity.
> 
> >> IOW, the "id" field is numeric and the translated data at the end of the
> >> raw record has "ID=unknown(number)".
> >> 
> >> I'm guessing it is because until the user data has been successfully
> >> entered, there is no translation. Perhaps the event submission should
> >> wait until that happens?
> > 
> > I'd say strace useradd will have the answer.
> 
> Let me know if the above isn't sufficient; I'll search again.

So...I went digging through the source code of useradd.c. In main is this 
comment:

        /*
         * Do the hard stuff:
         * - open the files,
         * - create the user entries,
         * - create the home directory,
         * - create user mail spool,
         * - flush nscd caches for passwd and group services,
         * - then close and update the files.
         */

If you dig around, you'll see in the above process it calls usr_update(). 
This is where the audit event is. The very next function call is close_files. 
This is where it actually writes to the files where it would be visible to 
auditd. So, it looks like auditing in shadow-utils is busted.

I also see where its calling pam_tally2 which is deprecated for years. It 
should be calling faillock. I'll chat with upstream maintainers.

-Steve


> >> I may be able to dig out the name from other related generated events,
> >> but that is kind of a pain.
> > 
> > Right. Let's see what the root cause is and then what we can do about it.
> 
> Thanks Steve.
> 
> I see plenty of audit events correlating to the above strace calls; e.g.:
> 
> node=audit type=ADD_GROUP msg=audit(05/15/2019 16:28:38.510:1684) :
> pid=25284 uid=root auid=iam1 ses=1
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='op=add-group acct=iam2 exe=/usr/sbin/useradd hostname=audit addr=?
> terminal=pts/1 res=success'
> ...
> node=audit type=ADD_USER msg=audit(05/15/2019 16:28:38.516:1686) :
> pid=25284 uid=root auid=iam1 ses=1
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='op=add-user id=iam2 exe=/usr/sbin/useradd hostname=audit addr=?
> terminal=pts/1 res=success'
> ...
> node=audit type=USER_MGMT msg=audit(05/15/2019 16:28:38.516:1687) :
> pid=25284 uid=root auid=iam1 ses=1
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='op=add-user-to-group grp=issm acct=iam2 exe=/usr/sbin/useradd
> hostname=audit addr=? terminal=pts/1 res=success'
> ...
> node=audit type=USER_MGMT msg=audit(05/15/2019 16:28:38.516:1688) :
> pid=25284 uid=root auid=iam1 ses=1
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='op=add-to-shadow-group grp=issm acct=iam2 exe=/usr/sbin/useradd
> hostname=audit addr=? terminal=pts/1 res=success'
> 
> ...
> 
> Then the user's home file setup events.
> 
> 
> 
> But wait, there's more and it isn't good at all. Here's what I did next,
> because I wanted to capture the events from an entirely new user.
> Previously, I was doing "useradd" as above followed by "userdel -rf
> iam2". Also iam3. Then I did:
> 
> [root@audit ~]# useradd -c iam10 -G issm iam10
> [root@audit ~]# ausearch -i -ts recent -m ADD_USER
> ----
> node=audit type=ADD_USER msg=audit(05/15/2019 16:43:28.456:1812) :
> pid=26210 uid=root auid=iam1 ses=1
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='op=add-user id=iam3 exe=/usr/sbin/useradd hostname=audit addr=?
> terminal=pts/1 res=success'
> [root@audit ~]# ausearch -i -ts recent -m ADD_USER
> 
> Note that although the user id is filled in, it is wrong. I thought that
> must be from an earlier add, so I did:
> 
> [root@audit ~]# userdel iam10 -rf
> 
> [root@audit ~]# ausearch -i -ts recent -m ADD_USER
> ----
> node=audit type=ADD_USER msg=audit(05/15/2019 16:43:28.456:1812) :
> pid=26210 uid=root auid=iam1 ses=1
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='op=add-user id=iam3 exe=/usr/sbin/useradd hostname=audit addr=?
> terminal=pts/1 res=success'
> [root@audit ~]# useradd -c iam10 -G issm iam10
> [root@audit ~]# ausearch -i -ts recent -m ADD_USER
> ----
> node=audit type=ADD_USER msg=audit(05/15/2019 16:43:28.456:1812) :
> pid=26210 uid=root auid=iam1 ses=1
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='op=add-user id=iam3 exe=/usr/sbin/useradd hostname=audit addr=?
> terminal=pts/1 res=success'
> ----
> node=audit type=ADD_USER msg=audit(05/15/2019 16:48:58.746:1965) :
> pid=26555 uid=root auid=iam1 ses=1
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='op=add-user id=iam3 exe=/usr/sbin/useradd hostname=audit addr=?
> terminal=pts/1 res=success'
> 
> So after sitting there in stunned silence a bit, I did:
> 
> [root@audit ~]# date
> Wed May 15 16:49:07 GMT 2019
> 
> [root@audit ~]# ausearch -r -a 1965  -ts recent
> node=audit type=ADD_USER msg=audit(1557938938.746:1965): pid=26555 uid=0
> auid=1000 ses=1
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='op=add-user id=1003 exe="/usr/sbin/useradd" hostname=audit addr=?
> terminal=pts/1 res=success'UID="root" AUID="iam1" ID="iam3"
> 
> 
> [root@audit ~]# grep iam /etc/passwd
> iam1:x:1000:1000:iam1:/home/iam1:/bin/bash
> iam2:x:1002:1002:iam2:/home/iam2:/bin/bash
> iam10:x:1003:1003:iam10:/home/iam10:/bin/bash
> 
> 
> So now I'm truly confused about what is happening.
> 
> Thx,
> 
> LCB




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
