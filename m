Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B71DC783
	for <lists+linux-audit@lfdr.de>; Fri, 18 Oct 2019 16:38:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FD4E757C6;
	Fri, 18 Oct 2019 14:38:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B31F85D70E;
	Fri, 18 Oct 2019 14:38:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3EE04EE68;
	Fri, 18 Oct 2019 14:38:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9IEcS9C031072 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 18 Oct 2019 10:38:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39B7E19D70; Fri, 18 Oct 2019 14:38:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 332D61C92A
	for <linux-audit@redhat.com>; Fri, 18 Oct 2019 14:38:21 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A272310F0C
	for <linux-audit@redhat.com>; Fri, 18 Oct 2019 14:38:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c2so1296376wrr.10
	for <linux-audit@redhat.com>; Fri, 18 Oct 2019 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=nXTYxHIWSzklMlyJNYpcpxgdwJ7GPcnj/sOYvZ/pR/A=;
	b=Z7YSvYsnswFvLCBAXw2/8LsMBNPr9czmgpVhTRFkS1J0C+31GVrsIwQj/iJrfV1X7+
	E1N+flPBa2tZCH8LyMNUnCHMsHomMWs9ErbokvQhU8zNxG1B7wx0d5NOpX5pVfvPmJq+
	przPBBiD6YEUWt3DS79N6pdMap3+DjC0msfYFPF1R6HA5YFeOx6ou+XyDmp7F9+WHgJx
	b0F0cIGVY55dXHUkFpUorWOzVLcBfn3Tjbm76Q8bVFb6VL+f5jGIWC4QExBIvQA4EuJd
	OnycA7X+ED07mQF6PC5UZEuDUrqrThPB3eP1IhKbs2e3C8jXNYagzbty3yE3pvOQzCF6
	HtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=nXTYxHIWSzklMlyJNYpcpxgdwJ7GPcnj/sOYvZ/pR/A=;
	b=l+HUspV8HHjWuFnN8RqOw/Bamc77ViAQBsvQcqWb1zSAh5mHndeTUa4ZLrbihnDolD
	BkW22tv9juT0GVgTkJ8WP3T2BNI6Ce4Vamxg6SbP6YT/Uj2nePkScAm6jEAW2cazbMcp
	Owzi/aka+9amQnmP7slMbHcPSMGR3i3SSyDHxB3l2c2f+R4tcPp1aheXVvIAp3obCLPY
	XOZj0GuFkv28M4xBkAsRhk8SYM3vMPrxpAE6wkBRuhMRgIxWGR6j/2IeqXBqM+iorb6R
	PYYuHhlpB2ky8Sjk+SmfwDarNA1GJ6RQaSYtEzoLACPoKo7TXNaA25pc0uc+TYRGQ4PC
	kMMw==
X-Gm-Message-State: APjAAAWZM7GJO/kOa3T5yGgi1u/nR2f/DEEm/ATXq92FoLgtZ3/CSkk+
	LVpPY5j0nGAlzmjsTy07wLRLHii3FU4HlgqpS8uDQUlpnQ0=
X-Google-Smtp-Source: APXvYqyRdP1V5aR93WucOZJvggHpc2sE4z25v2/1fk4tCjTMVR85Y/2WpGPGh/5KF6TUD0NMxDm3cfJuFiLxBYE+sRI=
X-Received: by 2002:adf:dd88:: with SMTP id x8mr6321185wrl.140.1571409498990; 
	Fri, 18 Oct 2019 07:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.103.1571328019.6486.linux-audit@redhat.com>
In-Reply-To: <mailman.103.1571328019.6486.linux-audit@redhat.com>
From: Evelyn Mitchell <efmphone@gmail.com>
Date: Fri, 18 Oct 2019 08:38:08 -0600
Message-ID: <CABD0H0vS3THc--rx2ZS=A_g8p-MvSX8EBzt7qa1R7or7ba3xNw@mail.gmail.com>
Subject: Re: New field seen in audit.log
To: linux-audit@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 18 Oct 2019 14:38:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 18 Oct 2019 14:38:20 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'efmphone@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <efmphone@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 18 Oct 2019 14:38:55 +0000 (UTC)

For my own learning, I'm trying to understand what personality=40000 means.

In looking at /uapi/linux/personality.h where the
personality types are defined, and manually converting 40000 to hex
0x9C40, it looks to me like the personality is set to enable:
ADDR_LIMIT_3GB =        0x8000000
SHORT_INODE =           0x1000000
ADDR_LIMIT_32BIT =      0x0800000
READ_IMPLIES_EXEC =     0x0400000
ADDR_COMPAT_LAYOUT =    0x0200000
MMAP_PAGE_ZERO =        0x0100000
ADDR_NO_RANDOMIZE =     0x0040000

But, this looks unreasonable to me as a set of flags someone would
deliberately pick, so I thought I'd ask if I'm interpreting this
correctly.

Evelyn Mitchell


> You may never have seen it before because it appears you now have a
> personality other than PER_LINUX for this event.  32-bit binary on 64
> bit?  I assume your arch is x86 64 (LE)?
>
> > type=SYSCALL msg=audit(1571245536.351:43593): arch=c000003e syscall=3
> > *per=40000* success=yes exit=0 a0=5 a1=5 a2=556213b6d6bc a3=7f483b98bcc0
> > items=0 ppid=2653 pid=2655 auid=1000 uid=1000 gid=1000 euid=1000 suid=1000
> > fsuid=1000 egid=1000 sgid=1000 fsgid=1000 tty=pts1 ses=3 comm="gdb"
> > exe="/usr/bin/gdb" key=(null)
> >
>
> - RGB
>
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
>
>
>
> ------------------------------

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
