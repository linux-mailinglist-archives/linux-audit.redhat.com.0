Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41AEF2B9598
	for <lists+linux-audit@lfdr.de>; Thu, 19 Nov 2020 16:00:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-W4DIxQFcPIifsGVQoqnBEg-1; Thu, 19 Nov 2020 10:00:10 -0500
X-MC-Unique: W4DIxQFcPIifsGVQoqnBEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2809184E246;
	Thu, 19 Nov 2020 15:00:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2BB660843;
	Thu, 19 Nov 2020 15:00:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 536534BB7B;
	Thu, 19 Nov 2020 15:00:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJExrau015694 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 09:59:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B3AD02166B2D; Thu, 19 Nov 2020 14:59:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEE372166B2B
	for <linux-audit@redhat.com>; Thu, 19 Nov 2020 14:59:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A22D10580C2
	for <linux-audit@redhat.com>; Thu, 19 Nov 2020 14:59:51 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-190-ExTG5108PDCz6Sfwabr6bg-1; Thu, 19 Nov 2020 09:59:49 -0500
X-MC-Unique: ExTG5108PDCz6Sfwabr6bg-1
Received: from mail-pl1-f200.google.com ([209.85.214.200])
	by youngberry.canonical.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <andreas.hasenack@canonical.com>) id 1kflPY-0004RI-0p
	for Linux-audit@redhat.com; Thu, 19 Nov 2020 14:59:48 +0000
Received: by mail-pl1-f200.google.com with SMTP id v8so3963414ply.0
	for <Linux-audit@redhat.com>; Thu, 19 Nov 2020 06:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=tjFkiHtvdobZgT0C2bZHgL9xBvxftnxSC/0bu2DWKRU=;
	b=lPGwOEHCw1SJ4beGLTkDxLRfABC7p8vjlUysNbxVQNvPtXPcehQi6nqy5UfpR/fuAa
	ATm6mwKUvBraz1DlEG1dTu9UjR6Taa/TfT8XpRmSdi1+qcI2yGNmiGJDYo7KXd9pyPxt
	MFR5PRgA4dlwV6P1Z6709ZV32z4lj1sL0qIAfD/7+W7TY5P6qm4cnB41DeiDB0KxWEY1
	VGaZddQZ/gAbtb0EnEQqF9YcmXhEhC2mkcoRVnfkHyJbpqXxgojl86d4VzKPDs92Z6Th
	bSe2jxLchK0Uv5VX1A41QWZDbZeavJAI1Vv65vUpTkIvuuSOXjBIwpD8JHFotU80WS9f
	dJYA==
X-Gm-Message-State: AOAM531RBo07ewaCQVVgbEfcnIdrTaHwn8xVGYRnRJv275No6eCqJU77
	bizlRNLWMp9N6GcQXlsQViQXbF2cVmif+cniggSzzsIrk7yiwkEC7nzjl4z82TXxThWCasCIW5a
	LGvrS0aXt0sbr1czTwKwSUgGpEhFFYjCGJV1heIAvcz1Z/mO7QA==
X-Received: by 2002:a17:90b:104c:: with SMTP id
	gq12mr4751648pjb.167.1605797986543; 
	Thu, 19 Nov 2020 06:59:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi2+MGml4qEVFhpjyLAHrPhJLQS4oZU06/X/y9/rABpF6tPeespxtR+k0i0qdwl4ALU64Af5ffuC/wSxRuxmY=
X-Received: by 2002:a17:90b:104c:: with SMTP id
	gq12mr4751625pjb.167.1605797986184; 
	Thu, 19 Nov 2020 06:59:46 -0800 (PST)
MIME-Version: 1.0
References: <CANYNYEGD9843AVu787kvczXyqBx1_+9PXW8g6TDUac2PyQ9O+g@mail.gmail.com>
	<3080581.aeNJFYEL58@x2>
In-Reply-To: <3080581.aeNJFYEL58@x2>
From: Andreas Hasenack <andreas@canonical.com>
Date: Thu, 19 Nov 2020 11:59:34 -0300
Message-ID: <CANYNYEGZn0HpCVvGyRd17JBdEkKFFbon6Zx1AxMszYKW33r-kw@mail.gmail.com>
Subject: Re: Default logging with no rules
To: Linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, Nov 19, 2020 at 11:34 AM Steve Grubb <sgrubb@redhat.com> wrote:
>
> On Thursday, November 19, 2020 9:04:24 AM EST Andreas Hasenack wrote:
> > I read in an old presentation (~2011) that these come from "trusted
> > apps",
>
> There are only 10 - 15 apps that are "trusted apps". They are logging events
> that are required by various security standards such as common criteria, DISA
> STIG, PCI DSS, etc.
>
> > and in fact any process with cap_audit_write (iirc) can log
> > such events.
>
> While that may be true, it is generally not the case that they do in fact
> log.
>
> > The tip was that exclude/never list/action could be used to reduce this
> > noise, is that still the case and recommended approach?
>
> If you must, sure. Trusted app events are in the 1100-1199 range. But which
> app is causing the problems that you see? In the past, we had to silence
> crond because it was noisy.

cron is one, for sure. Everytime it fires, it's a sequence of
USER_ACCT, CRED_ACQ, LOGIN, USER_START, CRED_DISP, USER_END. And it
doesn't really log useful information either, like the job it ran. The
syslog entry is more useful for that. In this example, I had a
/bin/true root crontab:
----
type=USER_ACCT msg=audit(11/19/20 14:44:01.418:368) : pid=32715
uid=root auid=unset ses=unset msg='op=PAM:accounting acct=root
exe=/usr/sbin/cron hostname=? addr=? terminal=cron res=success'
----
type=CRED_ACQ msg=audit(11/19/20 14:44:01.418:369) : pid=32715
uid=root auid=unset ses=unset msg='op=PAM:setcred acct=root
exe=/usr/sbin/cron hostname=? addr=? terminal=cron res=success'
----
type=LOGIN msg=audit(11/19/20 14:44:01.418:370) : pid=32715 uid=root
old-auid=unset auid=root tty=(none) old-ses=4294967295 ses=6 res=yes
----
type=USER_START msg=audit(11/19/20 14:44:01.418:371) : pid=32715
uid=root auid=root ses=6 msg='op=PAM:session_open acct=root
exe=/usr/sbin/cron hostname=? addr=? terminal=cron res=success'
----
type=CRED_DISP msg=audit(11/19/20 14:44:01.422:372) : pid=32715
uid=root auid=root ses=6 msg='op=PAM:setcred acct=root
exe=/usr/sbin/cron hostname=? addr=? terminal=cron res=success'
----
type=USER_END msg=audit(11/19/20 14:44:01.422:373) : pid=32715
uid=root auid=root ses=6 msg='op=PAM:session_close acct=root
exe=/usr/sbin/cron hostname=? addr=? terminal=cron res=success'
----

Another one is k8s apparently reapplying the iptables rules
frequently, so I get SYSCALL for setsockopt() with IPT_SO_SET_REPLACE
and NETFILTER_CFG entries. These perhaps I could turn off based on who
is emitting them via "exe=/foo/bar" and/or userid, as I can see this
happening very frequently as containers come and go.

>
> > Or is there a way to use audit with only the rules defined in /etc/audit/
> > rules.d?
>
> The rules in that dir are insufficient to fulfill regulatory requirements. If
> you are doing some kind of syscall experiment, then I can see that you might
> want to turn them off. But if your aim is meeting some kind of standard, then
> other events are required.

No standard or regulatory requirement required, I was just looking at
another layer of security to watch for specific events for which I
would create rules.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

