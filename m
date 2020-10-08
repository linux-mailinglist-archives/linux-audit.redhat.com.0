Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 404F2286C44
	for <lists+linux-audit@lfdr.de>; Thu,  8 Oct 2020 02:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602118583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uZ04o4MxkX5amYK+GFSx5hxTrgqpO6eh5V83x9dn388=;
	b=iVJHt9i6XlU0MymSrVdHJSqdtAf3zwcC8taXuPrkWMB6cUlRDoMaBeZ7h6n84EB9i6gdG4
	Zvveyak+7pVANfKCds5HHZEonxXL8epAw4gVTI1wRRgPhs3x41ep40KLENLW4CjMo9a4bw
	g5Omyx3cbzYfSHaKSO8GajTYRYMKKpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-WNvcV6R0PdKa-zmL8Tdh1Q-1; Wed, 07 Oct 2020 20:56:21 -0400
X-MC-Unique: WNvcV6R0PdKa-zmL8Tdh1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A6621074644;
	Thu,  8 Oct 2020 00:56:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22AF055761;
	Thu,  8 Oct 2020 00:56:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B84AF1832FC2;
	Thu,  8 Oct 2020 00:56:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0980twKS015371 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 7 Oct 2020 20:55:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB9CE702E7; Thu,  8 Oct 2020 00:55:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A08C50B44;
	Thu,  8 Oct 2020 00:55:52 +0000 (UTC)
Date: Wed, 7 Oct 2020 20:55:48 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: Re: auditing signals
Message-ID: <20201008005548.GD2882178@madcap2.tricolour.ca>
References: <20200929191744.GA2882171@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20200929191744.GA2882171@madcap2.tricolour.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-09-29 15:17, Richard Guy Briggs wrote:
> Hello auditors and auditees...
> 
> Have you got any rules or tests to test audit logging signals or ptrace?
> 
> I thought I understood how it worked, but it appears I need to signal a task group.

Ok, I got a hint elsewhere and was able to produce what I was looking for...

> I was a little less sure of how to trigger a ptrace audit log, but also figured that out.
> 
> I wrote up an audit-testsuite test case to test it and it made two seperate sys_kill calls which generated two events rather than the one I was looking for to fill the aux_pids structure.
> 
>         https://github.com/linux-audit/audit-testsuite/compare/master...rgbriggs:ghat81-test-signal-ptrace
> 
> It is essentially:
> 
>         sleep 5& t1=$!
>         sleep 5& t2=$!
>         auditctl -a always,exit -F arch=b64 -S kill -F key=testkill
>         kill -TERM $t1 $t2
>         sleep 1
>         auditctl -d always,exit -F arch=b64 -S kill -F key=testkill
>         sleep 2 # let the queue drain
>         ausearch -ts recent -i -k testkill

Here's a recipe that produces what I was looking for:

auditctl -a exit,always -F arch=b64 -S kill -F key=kill;
perl -e "
	setpgrp || die;
	fork || sleep 10;
	fork || sleep 10;
	sleep 10"&
pid=$!;
sleep 1;
kill TERM -$pid;
auditctl -d exit,always -F arch=b64 -S kill -F key=kill;
ausearch -ts recent -i -k kill -m OBJ_PID

> The output looks something like this when I was hoping for one event with two OBJ_PID records.
> 
> type=PROCTITLE msg=audit(04/08/2019 06:58:12.308:277) : proctitle=bash -l
> type=OBJ_PID msg=audit(04/08/2019 06:58:12.308:277) : opid=6104 oauid=root ouid=root oses=3 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=sleep
> type=SYSCALL msg=audit(04/08/2019 06:58:12.308:277) : arch=x86_64 syscall=kill success=yes exit=0 a0=0x17d8 a1=SIGTERM a2=0x0 a3=0x7f119b4919c0 items=0 ppid=6066 pid=6083 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=pts0 ses=3 comm=bash exe=/usr/bin/bash subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=testkill
> ----
> type=PROCTITLE msg=audit(04/08/2019 06:58:12.308:278) : proctitle=bash -l
> type=OBJ_PID msg=audit(04/08/2019 06:58:12.308:278) : opid=6105 oauid=root ouid=root oses=3 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=sleep
> type=SYSCALL msg=audit(04/08/2019 06:58:12.308:278) : arch=x86_64 syscall=kill success=yes exit=0 a0=0x17d9 a1=SIGTERM a2=0x0 a3=0x7f119b4919c0 items=0 ppid=6066 pid=6083 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=pts0 ses=3 comm=bash exe=/usr/bin/bash subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=testkill

And the output I was seeking:

----                                                                           
type=PROCTITLE msg=audit(10/07/2020 20:38:04.322:4109) : proctitle=-bash       
type=OBJ_PID msg=audit(10/07/2020 20:38:04.322:4109) : opid=72551 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl                                                                             
type=OBJ_PID msg=audit(10/07/2020 20:38:04.322:4109) : opid=72548 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl 
type=OBJ_PID msg=audit(10/07/2020 20:38:04.322:4109) : opid=72550 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl                                                                             
type=SYSCALL msg=audit(10/07/2020 20:38:04.322:4109) : arch=x86_64 syscall=kill success=yes exit=0 a0=0xfffee49c a1=SIGTERM a2=0x55f62915d3a0 a3=0x8 items=0 ppid=484 pid=506 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=bash exe=/usr/bin/bash subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=kill
----                                                                           

> Now the trick is how to trigger more than one OBJ_PID record in a single syscall, which was the original goal of the exercise.  It looks like it might need to be a signal sent to a process group with more than one task or a task that has threaded.
> 
> Can anyone suggest a simple test preferrably using our audit-testsuite perl infrasructure to get more than one OBJ_PID record?

I've got this working in the audit-testsuite case above.

> The code in question was introduced:
> 	c2f0c7c356dc <sgrubb@redhat.com> 2005-05-06 audit_signal_info AUDIT_TERM_INFO (single pid)                                                 
> 	e54dc2431d74 <amy.griffis@hp.com> 2007-03-29 ("[PATCH] audit signal recipients") (multi-pid)                                               
>                         When auditing syscalls that send signals, log the pid and security context for each target process.                                
>                         Optimize the data collection by adding a counter for signal-related rules, and avoiding allocating an aux struct unless we have more than one target process.                                                                                                                                  
>                         For process groups, collect pid/context data in blocks of 16.                                                                      
>                         Move the audit_signal_info() hook up in check_kill_permission() so we audit attempts where permission is denied.                   
> 	a5cb013da773 <viro@zeniv.linux.org.uk> 2007-03-20 ("[PATCH] auditing ptrace")
> 
> As a bit of an aside, it occurs to me that there could be information overwritten if signal information was stored before ptrace information stored since ptrace uses the context->target_* slot directly whereas signals check to see if that slot is used first and then overflows to the context->aux_pids structure.  If the ptrace information is always guaranteed to come first or alone, there is no issue.
> 
> If you are still reading this far, the interest in this arose from trying to find a way to connect potentially multiple OBJ_PID records with different CONTAINER_ID records in the ghak90 Audit Container ID patchset rather than using the op= field.

As you can see, there are now three OBJ_PID records in the event.  Next step is
to add this to the ghat64 contid test, then to assign a different audit
contaienr identifier to each and have each generate a CONTAINER_ID record that
can't be differentiated.  The obvious field addition to the CONTAINER_ID record
would be opid.

> Thanks!
> 
> - RGB

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

