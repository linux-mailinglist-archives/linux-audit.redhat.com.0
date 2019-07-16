Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7926B260
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jul 2019 01:30:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18FEA8553A;
	Tue, 16 Jul 2019 23:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F3CC6012C;
	Tue, 16 Jul 2019 23:30:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C4DC4E58F;
	Tue, 16 Jul 2019 23:30:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GNUVgF008084 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 19:30:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 558DF1EE; Tue, 16 Jul 2019 23:30:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 503275DAAC
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 23:30:29 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BAEAC057E29
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 23:30:28 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 62so10084316lfa.8
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 16:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YWcpEc5FvGUxMrkeRiB0cnwgYS5TPs4Urt5+gPVZDh8=;
	b=kfuVXg1GBNwcOoznZPvryqh6/i2XrbBE6hkmVUMgSZi+LTGFCMeiia9P0u53fqR03S
	Db8ww5cz17ZFCZKlTuva1FUSo3Y2oMZofZ8fP/h1fLivURlC81chU7PWbmPju7Admx1Z
	0vNl1Znw/JxnQbaEB3qodZy91u3UJcA/kBkF3/fop+D+uNxeIU9ClEdXjFRvVywlejx8
	DnAqQwuvXO4VpPWfxjCThhbeKljqILhPjFnODqbpRq1N11o4FSdml1BI7L1b7dz9y+YP
	fYw1lfsvEQejaiRHp3kfd9vzzpXxhC6v4ipIrx4uMBDRiXoRA77MJ55m7j30qsm5olyc
	8AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YWcpEc5FvGUxMrkeRiB0cnwgYS5TPs4Urt5+gPVZDh8=;
	b=aMOyQkODwGXpHsbykzPAy89vTGBOrLN182PrKWzyu0BxyjYNDakiwbzSIrTiQgq5SS
	rzPFe/H1muUZ1U8KdQpTu3/LI9przTSM3wHsRyYIXRnq5GXze6VkypBOIQQnqyxOAVqf
	pvRqBIjHWRkNQF+nzVcFxl4CEA7CA0psZmyvFAPVZPslHvpJZ/wRSbcFRsAclbdguR7h
	3kad5dqjyHY4EKPaUJ3J9DudPT7rTs+qU9uH0dOR2IZHHHhs4JEB0QfyBxpsYtSoveSe
	zfhUmm/Xp1kOzGxaNppVwgr3eubqCX8O48Wp08EBgdhjQIA8BTH1eAZq/vnLRP0MSxaE
	51Tg==
X-Gm-Message-State: APjAAAUtSVU7aJpJR0vM6hvENc7bOi1SQR/y/jPYowQLtRh3HhWV3ySV
	NTxVyVu7ijweoH3r5wl8kukgmTWlMlZnFjzU7qxRbrA=
X-Google-Smtp-Source: APXvYqxz39ngK72ytLQXqEXgHBnS7WXBpZpi6vOwRoyqlsR7YPmTcb6oeRneK/RtXK9BLw25UxnyGGXWi29uMJ0dI9o=
X-Received: by 2002:ac2:4109:: with SMTP id b9mr14480083lfi.31.1563319826317; 
	Tue, 16 Jul 2019 16:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
	<20190708180558.5bar6ripag3sdadl@madcap2.tricolour.ca>
	<CAHC9VhRTT7JWqNnynvK04wKerjc-3UJ6R1uPtjCAPVr_tW-7MA@mail.gmail.com>
	<20190716220320.sotbfqplgdructg7@madcap2.tricolour.ca>
In-Reply-To: <20190716220320.sotbfqplgdructg7@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jul 2019 19:30:15 -0400
Message-ID: <CAHC9VhScHizB2r5q3T5s0P3jkYdvzBPPudDksosYFp_TO7W9-Q@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 16 Jul 2019 23:30:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 16 Jul 2019 23:30:28 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, "Serge E. Hallyn" <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 16 Jul 2019 23:30:42 +0000 (UTC)

On Tue, Jul 16, 2019 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-07-15 17:04, Paul Moore wrote:
> > On Mon, Jul 8, 2019 at 2:06 PM Richard Guy Briggs <rgb@redhat.com> wrote:

...

> > > If we can't trust ns_capable() then why are we passing on
> > > CAP_AUDIT_CONTROL?  It is being passed down and not stripped purposely
> > > by the orchestrator/engine.  If ns_capable() isn't inherited how is it
> > > gained otherwise?  Can it be inserted by cotainer image?  I think the
> > > answer is "no".  Either we trust ns_capable() or we have audit
> > > namespaces (recommend based on user namespace) (or both).
> >
> > My thinking is that since ns_capable() checks the credentials with
> > respect to the current user namespace we can't rely on it to control
> > access since it would be possible for a privileged process running
> > inside an unprivileged container to manipulate the audit container ID
> > (containerized process has CAP_AUDIT_CONTROL, e.g. running as root in
> > the container, while the container itself does not).
>
> What makes an unprivileged container unprivileged?  "root", or "CAP_*"?

My understanding is that when most people refer to an unprivileged
container they are referring to a container run without capabilities
or a container run by a user other than root.  I'm sure there are
better definitions out there, by folks much smarter than me on these
things, but that's my working definition.

> If CAP_AUDIT_CONTROL is granted, does "root" matter?

Our discussions here have been about capabilities, not UIDs.  The only
reason root might matter is that it generally has the full capability
set.

> Does it matter what user namespace it is in?

What likely matters is what check is called: capable() or
ns_capable().  Those can yield very different results.

> I understand that root is *gained* in an
> unprivileged user namespace, but capabilities are inherited or permitted
> and that process either has it or it doesn't and an unprivileged user
> namespace can't gain a capability that has been rescinded.  Different
> subsystems use the userid or capabilities or both to determine
> privileges.

Once again, I believe the important thing to focus on here is
capable() vs ns_capable().  We can't safely rely on ns_capable() for
the audit container ID policy since that is easily met inside the
container regardless of the process' creds which started the
container.

> In this case, is the userid relevant?

We don't do UID checks, we do capability checks, so yes, the UID is irrelevant.

> > > At this point I would say we are at an impasse unless we trust
> > > ns_capable() or we implement audit namespaces.
> >
> > I'm not sure how we can trust ns_capable(), but if you can think of a
> > way I would love to hear it.  I'm also not sure how namespacing audit
> > is helpful (see my above comments), but if you think it is please
> > explain.
>
> So if we are not namespacing, why do we not trust capabilities?

We can trust capable(CAP_AUDIT_CONTROL) for enforcing audit container
ID policy, we can not trust ns_capable(CAP_AUDIT_CONTROL).

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
