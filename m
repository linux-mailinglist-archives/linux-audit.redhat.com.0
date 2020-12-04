Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A6C3C2CF5C2
	for <lists+linux-audit@lfdr.de>; Fri,  4 Dec 2020 21:41:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-kQWqDdzzOgGjfcC9cSBv8w-1; Fri, 04 Dec 2020 15:41:53 -0500
X-MC-Unique: kQWqDdzzOgGjfcC9cSBv8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 344D5193ECE2;
	Fri,  4 Dec 2020 20:41:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C80019C46;
	Fri,  4 Dec 2020 20:41:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C2311809C9F;
	Fri,  4 Dec 2020 20:41:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4KfOGJ003359 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 15:41:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 06FC6108489; Fri,  4 Dec 2020 20:41:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0161410848E
	for <linux-audit@redhat.com>; Fri,  4 Dec 2020 20:41:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 770D5811E76
	for <linux-audit@redhat.com>; Fri,  4 Dec 2020 20:41:21 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-13-SiAodQiPNmunFjG3E-cXFw-1; Fri, 04 Dec 2020 15:41:19 -0500
X-MC-Unique: SiAodQiPNmunFjG3E-cXFw-1
Received: by mail-ej1-f65.google.com with SMTP id qw4so10529167ejb.12
	for <linux-audit@redhat.com>; Fri, 04 Dec 2020 12:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9pAcCIIsmZ0qyxd5Lc3PNAsVbvTSn6MwxyLLFIcFYsE=;
	b=Z7KxJn2pNzgB/3Jb+GWcr/yaFF/vFV9sxXvDFC3PT7icAIq1r92q/r2kpsmjUDxXR5
	3VZi75MJXjTkNU9sSc+CkLYarcwey0nvVjXuxUyvlIzWMamurlP6ZpkVuc6mt4hHtaUx
	epyjOYPdiSlN9gLpYZNPKc0SJiLjrUUdRqyTysLwcnT9KJAC/MqaBYZYbaO4UCXlm0F5
	4ZguYLvG2HKa3p4ZG105x8L1d/bzp+R5fldxPl0qaJTNWWBM8FCThnoGby/o8mUmdgJb
	YrK38ApYUADjTJqdduWZ/hmeQioNtl89VD8uKdt7l71pCYCCUJtR1wfXqzeg9aGe1Gct
	V2Sg==
X-Gm-Message-State: AOAM533T3UT3sei3X3sS3qZLsqPPsb+vFCFxRXwiVw/0Xxw1R0I2E4gp
	S9OtsRd/hlJ9R9Fwq0HJFvrc2XT/A08n92fZR6vyXzHlUn5h
X-Google-Smtp-Source: ABdhPJwquVauODkpCvOB2tSkuFqhync8numf/prOgkG+7VaBjXTdU42jASAwg0pq0psa92qtDa+55sZaE9j/mHUotw4=
X-Received: by 2002:a17:906:268c:: with SMTP id
	t12mr8688010ejc.91.1607114478027; 
	Fri, 04 Dec 2020 12:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev> <20883376.EfDdHjke4D@x2>
	<CAHC9VhQyMD3XiP91u__SwOH-toAa=YBaCrwtvE8dVRVdh-wA0g@mail.gmail.com>
	<5413598.DvuYhMxLoT@x2>
In-Reply-To: <5413598.DvuYhMxLoT@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 4 Dec 2020 15:41:06 -0500
Message-ID: <CAHC9VhSF7BynebKq0o0Dec7qB5D0CNWLt9uj=Ky_72W0C-BJcg@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 3, 2020 at 9:47 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Thursday, December 3, 2020 9:16:52 PM EST Paul Moore wrote:
> > > > > Author:     Richard Guy Briggs <rgb@redhat.com>
> > > > > AuthorDate: 2014-11-17 15:51:01 -0500
> > > > > Commit:     Paul Moore <pmoore@redhat.com>
> > > > > CommitDate: 2014-11-17 16:53:51 -0500
> > > > > ("audit: convert status version to a feature bitmap")
> > > > > It was introduced specifically to enable distributions to selectively
> > > > > backport features.  It was converted away from AUDIT_VERSION.
> > > > >
> > > > > There are other ways to detect the presence of
> > > > > backlog_wait_time_actual
> > > > > as I mentioned above.
> > > >
> > > > Let me be blunt - I honestly don't care what Steve's audit userspace
> > > > does to detect this.  I've got my own opinion, but Steve's audit
> > > > userspace is not my project to manage and I think we've established
> > > > over the years that Steve and I have very different views on what
> > > > constitutes good design.
> > >
> > > And guessing what might be in buffers of different sizes is good design?
> > > The FEATURE_BITMAP was introduced to get rid of this ambiguity.
> >
> > There is just soo much to unpack in your comment Steve, but let me
> > keep it short ...
> >
> > - This is an enterprise distro problem, not an upstream problem.  The
> > problems you are talking about are not a problem for upstream.
>
> You may look at it that way. I do not. Audit -userspace is also an upstream
> for a lot of distros and I need to make this painless for them. So, while you
> may think of this being a backport problem for Red Hat to solve, I think of
> this as a generic problem that I'd like to solve for Debian, Suse, Ubuntu,
> Arch, Gentoo, anyone using audit. We both are upstream.

I intentionally said "enterprise Linux distributions", I never singled
out RH/IBM.  Contrary to what RH/IBM marketing may have me believe, I
don't consider RHEL to be the only "enterprise Linux distribution" :)

Beyond that, while I haven't looked at all of the distros you list
above, I know a few of them typically only backport fixes, not new
features.  Further, as I mentioned previously in this thread, there is
a way to backport this feature in a safe manner without using the
feature bits.  Eeeeeven further, if there wasn't a way to backport
this feature safely (and let me stress agai that you can backport this
safely), I would still consider that to be a distro problem and not an
upstream kernel problem.  The upstream kernel is not responsible for
enabling or supporting arbitrary combinations of patches.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

