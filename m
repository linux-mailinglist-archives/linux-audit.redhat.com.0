Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 22F302CE59F
	for <lists+linux-audit@lfdr.de>; Fri,  4 Dec 2020 03:21:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-x8iQPwD8Nd2Iu5rPpzL-8g-1; Thu, 03 Dec 2020 21:21:09 -0500
X-MC-Unique: x8iQPwD8Nd2Iu5rPpzL-8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C430858180;
	Fri,  4 Dec 2020 02:21:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F2E60BFA;
	Fri,  4 Dec 2020 02:21:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B4D44E58E;
	Fri,  4 Dec 2020 02:20:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B42HAos003612 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 21:17:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 084E4F18CE; Fri,  4 Dec 2020 02:17:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 026CDF11F1
	for <linux-audit@redhat.com>; Fri,  4 Dec 2020 02:17:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9FD28007D9
	for <linux-audit@redhat.com>; Fri,  4 Dec 2020 02:17:07 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-214-aL-9LeneP0CKWlnCGK06Bg-1; Thu, 03 Dec 2020 21:17:05 -0500
X-MC-Unique: aL-9LeneP0CKWlnCGK06Bg-1
Received: by mail-ej1-f66.google.com with SMTP id lt17so6521191ejb.3
	for <linux-audit@redhat.com>; Thu, 03 Dec 2020 18:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3O5iKfbMXAE0rYNEKARGcqqUOoeFsjh/wwYaFMxtz/c=;
	b=cu2/Wv1VGTM1qZI+CPO4W4vA6h4lStouo69OwRXU4wDm54qYXMNHiXkPaeZWf9YYcC
	/ZTejSgb8HO+UDVy6sHr4zH+BqMwtZpTf8UqnNKDqJPgDyaQ6LISwvQU3Nzr/aLymJDh
	VVXFmN7ZbruL87Nev6gYUZ/aLd0GJlvNvMQicVqPutGBmtBAy4bdJVQBzrXZ7PniGnCx
	ky7aQtPczAsc3rIKY/MlmiGHHX5JF4UO0wTjbH/YTyPvQH2ZpvWHzWdeYWk/hEYzyInC
	55/MV1QDUbQg28IZzxwzhHVzuHkMgsTaJyi3OWIRGCZC6rIG+5fyP5nUsl93DWlVePWA
	HpkQ==
X-Gm-Message-State: AOAM5327yvKjw5LwtU10GEifoeIppls56SY+kCncvzgW1X0DapGfirSX
	1k8/rzEV3WPhIFXAQc/TJ0jeEJleedY8kaxiBwIn
X-Google-Smtp-Source: ABdhPJxWXSCRwxr9Ld9sOyWklKlxRf/9zrFSzQnkWwf40Jw/0KetvWgQNf5XWAvQctt09JxNAocj97cIPYGNMEETADI=
X-Received: by 2002:a17:906:1393:: with SMTP id
	f19mr5113370ejc.431.1607048223845; 
	Thu, 03 Dec 2020 18:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev>
	<20201203231003.GK1762914@madcap2.tricolour.ca>
	<CAHC9VhR91u2VKy3RwxB4_bs3GdZupyq6oWKg5hPvacssc6tuOQ@mail.gmail.com>
	<20883376.EfDdHjke4D@x2>
In-Reply-To: <20883376.EfDdHjke4D@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 3 Dec 2020 21:16:52 -0500
Message-ID: <CAHC9VhQyMD3XiP91u__SwOH-toAa=YBaCrwtvE8dVRVdh-wA0g@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 3, 2020 at 6:55 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Thursday, December 3, 2020 6:43:11 PM EST Paul Moore wrote:
> > > So far there are only seven bits used out of 32, so it does not appear we
> > > are in danger of running out anytime soon.
>
> Exactly. Even capability bits are easier to get assigned.  :-)

Another way to look at it is that we've exhausted approximately
one-third of the space in six years.  In reality it is worse than that
as I've been putting the brakes on new feature bits for a while now.

> > > It was introduced with commit 0288d7183c41c0192d2963d44590f346f4aee917
> > > Author:     Richard Guy Briggs <rgb@redhat.com>
> > > AuthorDate: 2014-11-17 15:51:01 -0500
> > > Commit:     Paul Moore <pmoore@redhat.com>
> > > CommitDate: 2014-11-17 16:53:51 -0500
> > > ("audit: convert status version to a feature bitmap")
> > > It was introduced specifically to enable distributions to selectively
> > > backport features.  It was converted away from AUDIT_VERSION.
> > >
> > > There are other ways to detect the presence of backlog_wait_time_actual
> > > as I mentioned above.
> >
> > Let me be blunt - I honestly don't care what Steve's audit userspace
> > does to detect this.  I've got my own opinion, but Steve's audit
> > userspace is not my project to manage and I think we've established
> > over the years that Steve and I have very different views on what
> > constitutes good design.
>
> And guessing what might be in buffers of different sizes is good design? The
> FEATURE_BITMAP was introduced to get rid of this ambiguity.

There is just soo much to unpack in your comment Steve, but let me
keep it short ...

- This is an enterprise distro problem, not an upstream problem.  The
problems you are talking about are not a problem for upstream.

- You can obviously backport things, you just have to ensure you
preserve the structure order/size.  It may require you backporting
multiple features, but if you're already cherry-picking patches you've
already gone out on your own.  This approach is both obvious and
commonly done, if it hasn't occurred to you I don't know what to say.

... and finally, to be blunt again - I'm not merging a patch to add a
feature bit for this.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

