Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 396AC34E9B
	for <lists+linux-audit@lfdr.de>; Tue,  4 Jun 2019 19:20:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22F3EC4ECF;
	Tue,  4 Jun 2019 17:19:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1937100EBDF;
	Tue,  4 Jun 2019 17:19:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A23531806B15;
	Tue,  4 Jun 2019 17:18:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x54HIFFq023624 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 13:18:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B94B17DF0; Tue,  4 Jun 2019 17:18:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03CA117CFA
	for <linux-audit@redhat.com>; Tue,  4 Jun 2019 17:18:10 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47D9330C319F
	for <linux-audit@redhat.com>; Tue,  4 Jun 2019 17:18:01 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id q26so17041092lfc.3
	for <linux-audit@redhat.com>; Tue, 04 Jun 2019 10:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QeUo798vz7HhYw4EbpKO5sAMQCjOWInhC7aifH0PcFw=;
	b=KqxS8sl0M+TaQ7LPtX8YXG95+GDr1F4JhMbVfyD+DM25gaO0Ccl0UZrDK5QQmaS69e
	A29uwkjoOCmv1CZeGaz7ZJm+enf8HhINRPsnuc6a6+ogz2s1TDM3geKc9loP8003X/hy
	g/757i7wqiPCUW1tiWXKu5Aq0UgCztzCj22yzTz0fywHolczjFW0q5ZIVz+HrxDtuHgR
	aa3UsfC0kV05U49BIjO9uByfsMS/LScKN8HKU7iV2XSNiWZwY2/LIuKteCImGTfZ6Dj7
	NsRAYyNo/40Mv1Mv5Xv4ZPDQMsoWsG5WMjhxCGOZtNR2nQ85Scg+8fxB/SwAf9pkN65E
	fpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QeUo798vz7HhYw4EbpKO5sAMQCjOWInhC7aifH0PcFw=;
	b=qqDviMMsleNiisGu25LmRijRXTzEoJdaIyyWkXix1h/oSXVy3yEOG9mRZ4Wdieu50b
	mfmCAW381kWHgzGNlRELztB6SJnLu8n8CJAWufEU1lHDZQ/YXaubEgFhwRM7ewJDLevK
	z+7pbvGshpL9yq5Q8Uu6ahc/COeajQQ14EjgKSHPwDxBr+sMgRPVYuTU/ekh8BZQbd52
	uV7Cx8n1cODMTZ/q6qyKpPAfzZL+k3orY8SXjihaFwQm6VwGqod8AwiEPEVLLJAv7IOg
	K7zZIL3c5TakB8vIn6pTFQjkOZMugN+dbEdZYiJwFqdJ8dCJPHVIx14NE2CZnbCx99Vc
	ggfQ==
X-Gm-Message-State: APjAAAUFC8fczmIzTSCjf+LZz6DjrMcjGN6+aXDxkVw9NTk5MR5XFpr2
	1VG/fm5SRKYqMcppBIncOIi/QQBPlOyV6dfjuT+1vd4=
X-Google-Smtp-Source: APXvYqy5M4WaPJM1n+VVkF4X+bkVmkjvEz3Ze2xcHVAiR4Qjy7BIMbtZukZSs13jqUiu1y0kGO/p6lNdmpp94nGrxiQ=
X-Received: by 2002:ac2:4111:: with SMTP id b17mr2962635lfi.31.1559668679489; 
	Tue, 04 Jun 2019 10:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <fadb320e38a899441fcc693bbbc822a3b57f1a46.1559239558.git.rgb@redhat.com>
	<CAHC9VhQZuOXiK4yj4xeRwGF_qepeg7qDL02GDdYhwTNRLRdmPA@mail.gmail.com>
	<7059722c-99a5-fd0b-9a7a-7a9afc99cb39@redhat.com>
In-Reply-To: <7059722c-99a5-fd0b-9a7a-7a9afc99cb39@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 4 Jun 2019 13:17:48 -0400
Message-ID: <CAHC9VhSLBxBeU-Hsm6ZY4aSd6u2yGQu3+aqaw3Tjuk=O=2xgUw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6] fixup! audit: add containerid filtering
To: Dan Walsh <dwalsh@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 04 Jun 2019 17:18:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 04 Jun 2019 17:18:01 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.803  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 04 Jun 2019 17:20:15 +0000 (UTC)

On Tue, Jun 4, 2019 at 3:55 AM Daniel Walsh <dwalsh@redhat.com> wrote:
> The need for nested container support is the `Enemy of the good`.  This
> idea has been being worked on for years and has always been blocked by
> this seldom used feature.

Speaking with some of the LXC folks, nested orchestrators isn't a
seldom used feature for them, they see bug reports on a regular basis
from users nesting various different orchestrators.  You are correct
that we didn't originally think this was very common, which is
unfortunate, but it's better we fix this now than push something into
the kernel which might require a kernel API change to be useful to a
wider audience.  To be clear, that's where we are at: we need to
figure out what the kernel API would look like to support nested
container orchestrators.  My gut feeling is that this isn't going to
be terribly complicated compared to the rest of the audit container ID
work, but it is going to be some work.  We had a discussion about some
potential solutions in the cover letter and it sounds like Richard is
working up some ideas now, let's wait to see what that looks like.

> We are working on a project right this summer to allow us to use the
> audit system to track the syscalls used by a container and then generate
> a seccomp.json file to lock down the container in the future.  Think of
> it as Audit2allow for seccomp rules on a container.  The problem is,
> other then PID1 inside of the container, it is real difficult to follow
> the other processes inside of the container without a containerid.

That sounds interesting.

> Is there a chance we could get a single ID for a container for now, and
> then enhance the feature in the future for nested ContainerIDs.

The blocker is the kernel/userspace API; I'm not going to merge code
which provides an API which breaks when you try to nest orchestrators.
Whatever we pick we are likely going to have to support f-o-r-e-v-e-r,
so I want to make sure it is useful for the significant use cases we
have today.

> I fear that this will block the container id for years.

It's ready when it's ready.

> On 6/3/19 6:01 PM, Paul Moore wrote:
> > On Fri, May 31, 2019 at 1:54 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> Remove the BUG() call since we will never have an invalid op value as
> >> audit_data_to_entry()/audit_to_op() ensure that the op value is a a
> >> known good value.
> >>
> >> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> >> ---
> >>  kernel/auditfilter.c | 1 -
> >>  1 file changed, 1 deletion(-)
> > Thanks for sending this out.  However, in light of the discussion in
> > the patchset's cover letter it looks like we need to better support
> > nested container orchestrators which is likely going to require some
> > non-trivial changes to the kernel/userspace API.  Because of this I'm
> > going to hold off pulling these patches into a "working" branch,
> > hopefully the next revision of these patches will solve the nested
> > orchestrator issue enough that we can continue to move forward with
> > testing.
> >
> >> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> >> index 407b5bb3b4c6..385a114a1254 100644
> >> --- a/kernel/auditfilter.c
> >> +++ b/kernel/auditfilter.c
> >> @@ -1244,7 +1244,6 @@ int audit_comparator64(u64 left, u32 op, u64 right)
> >>         case Audit_bittest:
> >>                 return ((left & right) == right);
> >>         default:
> >> -               BUG();
> >>                 return 0;
> >>         }
> >>  }
> >> --
> >> 1.8.3.1
> >>
> >
>
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit



-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
