Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 98983D9BB3
	for <lists+linux-audit@lfdr.de>; Wed, 16 Oct 2019 22:23:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 525448667D;
	Wed, 16 Oct 2019 20:23:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BCE119C6A;
	Wed, 16 Oct 2019 20:23:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A11774A486;
	Wed, 16 Oct 2019 20:23:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9GKFVwY016523 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 16 Oct 2019 16:15:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B436E60127; Wed, 16 Oct 2019 20:15:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-29.phx2.redhat.com [10.3.117.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE1B260167;
	Wed, 16 Oct 2019 20:15:17 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Ankitha Kundhuru <akundhuru@cs.stonybrook.edu>
Subject: Re: New field seen in audit.log
Date: Wed, 16 Oct 2019 16:15:17 -0400
Message-ID: <7632538.cuNEITiOso@x2>
Organization: Red Hat
In-Reply-To: <CAG-5c_ERofGJWMKv0SZiSZvsRdLYLboBP4anZYOChpvL-=Wq+Q@mail.gmail.com>
References: <CAG-5c_ERofGJWMKv0SZiSZvsRdLYLboBP4anZYOChpvL-=Wq+Q@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 16 Oct 2019 20:23:48 +0000 (UTC)

Hello,

On Wednesday, October 16, 2019 3:36:43 PM EDT Ankitha Kundhuru wrote:
> I found a new word "per" in some of the records of my audit.log.
> Any idea of why this happened 

The process personality is not normal. 

> and what it means ?

https://github.com/linux-audit/audit-documentation/blob/master/specs/fields/
field-dictionary.csv#L176

You can use ausearch -i to decode it.

-Steve

> type=SYSCALL msg=audit(1571245536.351:43593): arch=c000003e syscall=3
> *per=40000* success=yes exit=0 a0=5 a1=5 a2=556213b6d6bc a3=7f483b98bcc0
> items=0 ppid=2653 pid=2655 auid=1000 uid=1000 gid=1000 euid=1000 suid=1000
> fsuid=1000 egid=1000 sgid=1000 fsgid=1000 tty=pts1 ses=3 comm="gdb"
> exe="/usr/bin/gdb" key=(null)
> 
> Thank you :)
> 
> Thanks & Regards,
> Ankitha Kundhuru




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
