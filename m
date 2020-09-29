Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CB18727D6B2
	for <lists+linux-audit@lfdr.de>; Tue, 29 Sep 2020 21:18:22 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601407101;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v+IpI9G2q3Z9bzEfy0e31D8lMLlDcaOwIiCoHnTQbts=;
	b=e6gp7nOQzaF3Yzd9/RzycmChRsTGbPRlOW2Cr0fKghuZ8otjtdl8arCRhqj5sw1Ttr18LN
	052H9XwZct0VOvkd1q2BnHlJM54FODWo/xEGHW2eI2auFTZYL341pWRr7Aadzqe9ellQNL
	lwkVhDuRRc9NAV3lGD8ymwCqaFjw1WA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-riLXUPNVNXu8ZsNwnzBqqA-1; Tue, 29 Sep 2020 15:18:19 -0400
X-MC-Unique: riLXUPNVNXu8ZsNwnzBqqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F146F186DD26;
	Tue, 29 Sep 2020 19:18:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9685260BF1;
	Tue, 29 Sep 2020 19:18:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F45044A5A;
	Tue, 29 Sep 2020 19:18:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08TJHtxt027017 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 15:17:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6AF35D9DC; Tue, 29 Sep 2020 19:17:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31C635D9CA;
	Tue, 29 Sep 2020 19:17:49 +0000 (UTC)
Date: Tue, 29 Sep 2020 15:17:44 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: auditing signals
Message-ID: <20200929191744.GA2882171@madcap2.tricolour.ca>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello auditors and auditees...

Have you got any rules or tests to test audit logging signals or ptrace?

I thought I understood how it worked, but it appears I need to signal a task group.

I was a little less sure of how to trigger a ptrace audit log, but also figured that out.

I wrote up an audit-testsuite test case to test it and it made two seperate sys_kill calls which generated two events rather than the one I was looking for to fill the aux_pids structure.

        https://github.com/linux-audit/audit-testsuite/compare/master...rgbriggs:ghat81-test-signal-ptrace

It is essentially:

        sleep 5& t1=$!
        sleep 5& t2=$!
        auditctl -a always,exit -F arch=b64 -S kill -F key=testkill
        kill -TERM $t1 $t2
        sleep 1
        auditctl -d always,exit -F arch=b64 -S kill -F key=testkill
        sleep 2 # let the queue drain
        ausearch -ts recent -i -k testkill

The output looks something like this when I was hoping for one event with two OBJ_PID records.

type=PROCTITLE msg=audit(04/08/2019 06:58:12.308:277) : proctitle=bash -l
type=OBJ_PID msg=audit(04/08/2019 06:58:12.308:277) : opid=6104 oauid=root ouid=root oses=3 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=sleep
type=SYSCALL msg=audit(04/08/2019 06:58:12.308:277) : arch=x86_64 syscall=kill success=yes exit=0 a0=0x17d8 a1=SIGTERM a2=0x0 a3=0x7f119b4919c0 items=0 ppid=6066 pid=6083 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=pts0 ses=3 comm=bash exe=/usr/bin/bash subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=testkill
----
type=PROCTITLE msg=audit(04/08/2019 06:58:12.308:278) : proctitle=bash -l
type=OBJ_PID msg=audit(04/08/2019 06:58:12.308:278) : opid=6105 oauid=root ouid=root oses=3 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=sleep
type=SYSCALL msg=audit(04/08/2019 06:58:12.308:278) : arch=x86_64 syscall=kill success=yes exit=0 a0=0x17d9 a1=SIGTERM a2=0x0 a3=0x7f119b4919c0 items=0 ppid=6066 pid=6083 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=pts0 ses=3 comm=bash exe=/usr/bin/bash subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=testkill

Now the trick is how to trigger more than one OBJ_PID record in a single syscall, which was the original goal of the exercise.  It looks like it might need to be a signal sent to a process group with more than one task or a task that has threaded.

Can anyone suggest a simple test preferrably using our audit-testsuite perl infrasructure to get more than one OBJ_PID record?

The code in question was introduced:
	c2f0c7c356dc <sgrubb@redhat.com> 2005-05-06 audit_signal_info AUDIT_TERM_INFO (single pid)                                                 
	e54dc2431d74 <amy.griffis@hp.com> 2007-03-29 ("[PATCH] audit signal recipients") (multi-pid)                                               
                        When auditing syscalls that send signals, log the pid and security context for each target process.                                
                        Optimize the data collection by adding a counter for signal-related rules, and avoiding allocating an aux struct unless we have more than one target process.                                                                                                                                  
                        For process groups, collect pid/context data in blocks of 16.                                                                      
                        Move the audit_signal_info() hook up in check_kill_permission() so we audit attempts where permission is denied.                   
	a5cb013da773 <viro@zeniv.linux.org.uk> 2007-03-20 ("[PATCH] auditing ptrace")

As a bit of an aside, it occurs to me that there could be information overwritten if signal information was stored before ptrace information stored since ptrace uses the context->target_* slot directly whereas signals check to see if that slot is used first and then overflows to the context->aux_pids structure.  If the ptrace information is always guaranteed to come first or alone, there is no issue.

If you are still reading this far, the interest in this arose from trying to find a way to connect potentially multiple OBJ_PID records with different CONTAINER_ID records in the ghak90 Audit Container ID patchset rather than using the op= field.

Thanks!

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

