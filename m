Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9CB28C28
	for <lists+linux-audit@lfdr.de>; Thu, 23 May 2019 23:12:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A61C6EB88;
	Thu, 23 May 2019 21:12:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CED2319724;
	Thu, 23 May 2019 21:11:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80EC71806B12;
	Thu, 23 May 2019 21:11:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4NLAf4g004587 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 17:10:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FDB71001E79; Thu, 23 May 2019 21:10:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E09A71001DDB;
	Thu, 23 May 2019 21:10:35 +0000 (UTC)
Date: Thu, 23 May 2019 17:10:32 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: Auditing write syscall
Message-ID: <20190523211032.nj7rsdxkj6uf5wh7@madcap2.tricolour.ca>
References: <CADK+bLxes0UKt0Uoj64h=vNhrJfA0RVj1Ai8onLYbMCG-5uB6g@mail.gmail.com>
	<1632868.IOzhRHTBn1@x2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1632868.IOzhRHTBn1@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 23 May 2019 21:12:07 +0000 (UTC)

On 2019-05-14 09:55, Steve Grubb wrote:
> Hello,
> 
> On Monday, May 13, 2019 3:43:54 PM EDT Ondra N. wrote:
> > I would like to ask a question about auditing write syscalls.  I am trying
> > to monitor all filesystem changes in a specific directory and process the
> > changes in near real time - audispd, was very helpful with that.
> > 
> > What concerns me is what if a filedescriptor is kept open for long periods
> > of time and written to once in a while? Only the open syscall is logged
> > when using a rule like this one.
> > 
> > auditctl -w /tmp/rnd_pop -p wa -k test_key
> 
> Right. And if this triggers then you have to assume that the file was modified. 
> In the past I worked with various upstream projects to have them open a 
> descriptor read only and reopen when they need to modify files. This cuts down 
> on false alarms.
> 
> > I was thinking that maybe being more explicit about what I want to do could
> > help like setting up a rule like this one.
> > 
> > auditctl -a always,exit -F dir=/tmp/rnd_pop -F perm=w -F succes=1 -k
> > test_key
> > 
> > But it doesnt seem to work for me, I guess I cannot filter write syscall by
> > directory because nothing ever shows up in the audit.log with a rule like
> > this.
> 
> The directory has to be immediately accessible to the syscall at the time of 
> the syscall. When open is called, the path is immediately available as it is 
> one of the syscall parameters. The write only has the FD which does not have 
> the path associated with the FD accessible. Something in the kernel does keep 
> this info around as the procfs has path info. But I think it's racey and 
> could be stale  if you have a multithreaded app. 

The FD points to a struct file with struct path that includes a vfsmnt
and a dentry/inode, which could be used to create a PATH record, I
think.  A hook could be added to the write syscall to store it with
audit_file().  Similar hooks would need to be added to other syscalls
that read and access and execute FDs to round out that functionality.
This is already present for chmod, chown, f*xattr.  Having a generic
syscall parser that can detect these might be possible, but would
probably present an unacceptable performance hit.

I do have concerns that it could be racey and stale.

> I think there was some reason why this info cannot be used for path 
> resolution for syscall filtering. I think Paul or Richard may need to answer 
> why this cannot be used. Perhaps it could be that how do you know in a 
> generic way based on any given syscall that one parameter is a file descriptor 
> that can be cross referenced?

This is even Al Viro territory...

> > What is the intended way to achieve logging of write syscalls in specific
> > directory, am i missing something? Should I check myself if the file is
> > still open when event is being processed and act accordingly?
> 
> I think some kinds of things will always be just out of reach for the audit 
> system. Other tools like aide can help fill in the blanks. And there is also 
> the fanotify interface where detailed change information can be gathered.

Tracking the inode could work, but that would have to be dynamic to be
practical, I suspect, and likely the domain of *notify.

> -Steve

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
