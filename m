Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C25208C2
	for <lists+linux-audit@lfdr.de>; Thu, 16 May 2019 15:58:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D47218830A;
	Thu, 16 May 2019 13:57:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A8881800D;
	Thu, 16 May 2019 13:57:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB5DC24AFA;
	Thu, 16 May 2019 13:57:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GDurCl014124 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 09:56:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E33DF10027BB; Thu, 16 May 2019 13:56:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCD341001DED;
	Thu, 16 May 2019 13:56:47 +0000 (UTC)
Date: Thu, 16 May 2019 09:56:44 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: "Wolff Felix (ETAS-SEC/ECT-Be)" <Felix.Wolff@escrypt.com>
Subject: Re: Error starting auditd
Message-ID: <20190516135644.nt3l4l4xwmrkhizl@madcap2.tricolour.ca>
References: <3dc64aea26e94e68818b81289f1a713b@escrypt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3dc64aea26e94e68818b81289f1a713b@escrypt.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <Linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 16 May 2019 13:58:23 +0000 (UTC)

On 2019-05-16 10:47, Wolff Felix (ETAS-SEC/ECT-Be) wrote:
> Hello,

Hi Felix,

> I am currently porting auditd to a new platform. When starting it using `auditd -f`, I get the following error:
> 
> "Error setting audit daemon pid (File exists)"
> 
> It occurs during the call to `audit_set_pid(fd, getpid(), WAIT_YES);` in auditd.c. If I understand correctly, this call registers auditd with the kernel, is that correct? fd looks like a valid file descriptor, at least its >0. Especially the "file exists" part confuses me. In which direction can I investigate that error?

It appears you already have a process/task that is registered with the
kernel for this purpose and it is still alive and healthy.  On a normal
system I would say it is likely auditd that was started by the system.
On yours, are you sure you haven't got a previous one already at least
partly running?

The line responsible in the kernel is here:
	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/audit.c#n1262

> Thank you and greets,
> Felix

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
