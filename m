Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB979C78
	for <lists+linux-audit@lfdr.de>; Tue, 30 Jul 2019 00:33:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F21D8A3B46;
	Mon, 29 Jul 2019 22:33:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0C610016EA;
	Mon, 29 Jul 2019 22:33:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58A111800239;
	Mon, 29 Jul 2019 22:33:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TMX3vs015887 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 18:33:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FACB19C70; Mon, 29 Jul 2019 22:33:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-31.phx2.redhat.com [10.3.112.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBDAE19C58;
	Mon, 29 Jul 2019 22:32:57 +0000 (UTC)
Date: Mon, 29 Jul 2019 18:32:49 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: boot parameter question
Message-ID: <20190729223249.wvzvqmjwzxeg4p54@madcap2.tricolour.ca>
References: <e8fbd095-9983-528e-dc8e-602280b414d8@magitekltd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8fbd095-9983-528e-dc8e-602280b414d8@magitekltd.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <linux-audit@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 29 Jul 2019 22:33:21 +0000 (UTC)

On 2019-07-25 19:52, Lenny Bruzenak wrote:
> I'm having trouble getting my "audit_backlog_limit" boot parameter
> accepted.
> =

> I have the following 2 audit parameters on my boot line:
> =

> audit=3D1
> =

> audit_backlog_limit=3D8192
> =

> My /proc/cmdline shows them both once booted up.
> =

> But I'm not getting the audit_backlog_limit applied to the kernel audit
> startup. I have a auditctl -b 8192 that runs from the audit.rules, and
> the resulting CONFIG_change event shows "...audit_backlog_limit=3D8192,
> old=3D64...".
> =

> After startup I run:
> =

> # auditctl -s
> =

> and see that I've lost 93 events.
> =

> =

> Looking at the kernel code, I see that if the "audit=3D1" value is set, it
> should print:
> =

> "enabled (after initialization)" , which I see in both dmesg and
> /var/log/messages,
> =

> The second one (audit_backlog_limit=3D8192) should output IIUC:
> =

> "audit_backlog_limit: "=A0 , which I don't see anywhere.
> =

> It's as if the parameter is being ignored. I've tried moving it to a
> different spot so it isn't the last on the line, etc. Nothing.

It is being ignored because that kernel command line extension to the
original feature was never backported to RHEL7.

In hindsight, that would have been pretty useful without causing much
risk.  Normally feature backport is driven by customer demand.  There
was a bit of pushback when it was first introduced upstream, but this is
exactly the scenario I envisioned where it would be most useful.  It is
possible to compile your own kernel and change the default value, but
that's obviously a hurdle for most.

> I stumbled on this because I'm not seeing the "SYSTEM_BOOT" events
> anymore; I suspect they are in the missing ones.
> =

> Pretty sure I don't have a typo; I've put it into the grub config and
> run the grub2-mkconfig -o /boot/grub2/grub.cfg and booted from that.
> Again, the parameter is there in /proc/cmdline but doesn't seem to be
> accepted. No warnings about it either AFAICT.
> =

> RHEL7.6, kernel 3.10.0-957
> =

> Don't think the audit userspace version makes much difference, but it is
> 2.8.5.
> =

> Thanks in advance,
> =

> LCB
> =

> -- =

> Lenny Bruzenak

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
