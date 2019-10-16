Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D04DAD9BA0
	for <lists+linux-audit@lfdr.de>; Wed, 16 Oct 2019 22:22:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C3C9300DFA9;
	Wed, 16 Oct 2019 20:22:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93DD360BF7;
	Wed, 16 Oct 2019 20:22:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEFED1800535;
	Wed, 16 Oct 2019 20:22:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9GKCL1T016446 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 16 Oct 2019 16:12:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36B496061E; Wed, 16 Oct 2019 20:12:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88EF66060D;
	Wed, 16 Oct 2019 20:12:13 +0000 (UTC)
Date: Wed, 16 Oct 2019 16:12:10 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Ankitha Kundhuru <akundhuru@cs.stonybrook.edu>
Subject: Re: New field seen in audit.log
Message-ID: <20191016201210.fsqagtx6yehzqxmy@madcap2.tricolour.ca>
References: <CAG-5c_ERofGJWMKv0SZiSZvsRdLYLboBP4anZYOChpvL-=Wq+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG-5c_ERofGJWMKv0SZiSZvsRdLYLboBP4anZYOChpvL-=Wq+Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 16 Oct 2019 20:22:08 +0000 (UTC)

On 2019-10-16 15:36, Ankitha Kundhuru wrote:
> Hi All,
> 
> I found a new word "per" in some of the records of my audit.log.
> Any idea of why this happened and what it means ?

This is a "swinging" field, which means that it only appears when it is
different from an expected value (zero usually expected).

That isn't new.  It has been there since the very first audit commit,
	commit b7b0074ca3c9fe22d07b97e42a99c8b27be6307f
	Author:     Andrew Morton <akpm@osdl.org>
	AuthorDate: 2004-04-11 23:29:12 -0700
		Light-weight Auditing Framework
		From: Rik Faith <faith@redhat.com>

You may never have seen it before because it appears you now have a
personality other than PER_LINUX for this event.  32-bit binary on 64
bit?  I assume your arch is x86 64 (LE)?

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
