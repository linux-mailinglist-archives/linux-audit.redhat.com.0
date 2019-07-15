Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158769D3B
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jul 2019 23:04:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 375FC8553A;
	Mon, 15 Jul 2019 21:04:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70F955D721;
	Mon, 15 Jul 2019 21:04:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B332918433A1;
	Mon, 15 Jul 2019 21:04:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FL4jv8019108 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 17:04:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B4B245D9C6; Mon, 15 Jul 2019 21:04:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB95C5D9D2
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 21:04:43 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 699B083F4C
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 21:04:42 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k18so17699704ljc.11
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nMdAH6nTLDrGvTqGSOAbQkcOJz7RylQFzwai+/2x5Kg=;
	b=C00/OWh9vq2MRiQn1E4VUuP+O+05mZjNiBnTBYE91LA3zA6l01Y3ZAFqD2sa2HJkYA
	h5J92fYmst8NEM4kbY7z9ANwjGbMbqg3KDgovAqdXLcZH01wV9eGew+ThGgGmvphgmAD
	MxCVdar45y7UYA1DDtDoQVv8dYq4cWtZjZQ6/WT8LjTbkRr544wt+KFFducPNhPYqfvf
	wvewvBAHmtMQ3UdggObhYJdHU1TEreaMfaoyjsOy6hYFNOwCZ9YqhCLMTU3973yjiSJE
	Yi+PlsVJ+lpWQCfj+ktNFR7xMaZJmXQJhqz9OR+Yp0H3xtV8sPxtgsA5H5qa8lTtOAmU
	09Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nMdAH6nTLDrGvTqGSOAbQkcOJz7RylQFzwai+/2x5Kg=;
	b=stDOSfGSsSOPJ460L4sewjqwXr8hg0Tv+3XuLrrF7lZWOd8GobrxSC3KfmLHGwdyjf
	j8+GHXuF8zPd5CKi6xzrezvgUMLi4FtT5MJ8xQLEZxpFxvJ/qkmgjjR8zRgJCCX2ScnB
	iNUiLfNQO30ujz+MqzQsC5TF5Lgk7P4IBnMlACJu/uVKQnuw6G34kskvfEQbcvhqs6qR
	LzD+7Nlpwqx+6tm6tXQlqfW2m2GcrdDqRwqjZkVFVC1mszfbSW3r68DgwF3lEvS5SJbT
	JgJCfDZueYdu13TGgQEsPixs7dUTkf/G2q9WifhPlv3ZiBYGqQ4JBGM5bppWqg6hxFPE
	sDpw==
X-Gm-Message-State: APjAAAVYuAn+FDnHrsZRWawl9B5Hu7vFE7BFdLQWi5SufdyGHOIXC6Xp
	rMcuaI/kEHhPzvbOdgDFYENjfCDJa0wU5pEm+A==
X-Google-Smtp-Source: APXvYqx7xtowySesa4+9lw6Ozl7JVLEqOjJfTZIHvPqefLlVsTXkwA71CsctPNus3iiABl3+IN2es94OlE7TcFEpzio=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr14605368lje.46.1563224680729; 
	Mon, 15 Jul 2019 14:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
	<20190708180558.5bar6ripag3sdadl@madcap2.tricolour.ca>
In-Reply-To: <20190708180558.5bar6ripag3sdadl@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Jul 2019 17:04:29 -0400
Message-ID: <CAHC9VhRTT7JWqNnynvK04wKerjc-3UJ6R1uPtjCAPVr_tW-7MA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 15 Jul 2019 21:04:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 15 Jul 2019 21:04:42 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 15 Jul 2019 21:04:56 +0000 (UTC)

On Mon, Jul 8, 2019 at 2:06 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-30 15:29, Paul Moore wrote:

...

> > [REMINDER: It is an "*audit* container ID" and not a general
> > "container ID" ;)  Smiley aside, I'm not kidding about that part.]
> >
> > I'm not interested in supporting/merging something that isn't useful;
> > if this doesn't work for your use case then we need to figure out what
> > would work.  It sounds like nested containers are much more common in
> > the lxc world, can you elaborate a bit more on this?
> >
> > As far as the possible solutions you mention above, I'm not sure I
> > like the per-userns audit container IDs, I'd much rather just emit the
> > necessary tracking information via the audit record stream and let the
> > log analysis tools figure it out.  However, the bigger question is how
> > to limit (re)setting the audit container ID when you are in a non-init
> > userns.  For reasons already mentioned, using capable() is a non
> > starter for everything but the initial userns, and using ns_capable()
> > is equally poor as it essentially allows any userns the ability to
> > munge it's audit container ID (obviously not good).  It appears we
> > need a different method for controlling access to the audit container
> > ID.
>
> We're not quite ready yet for multiple audit daemons and possibly not
> yet for audit namespaces, but this is starting to look a lot like the
> latter.

A few quick comments on audit namespaces: the audit container ID is
not envisioned as a new namespace (even in nested form) and neither do
I consider running multiple audit daemons to be a new namespace.

>From my perspective we create namespaces to allow us to redefine a
global resource for some subset of the system, e.g. providing a unique
/tmp for some number of processes on the system.  While it may be
tempting to think of the audit container ID as something we could
"namespace", especially when multiple audit daemons are concerned, in
some ways this would be counter productive; the audit container ID is
intended to be a global ID that can be used to associate audit event
records with a "container" where the "container" is defined by an
orchestrator outside the audit subsystem.  The global nature of the
audit container ID allows us to maintain a sane(ish) view of the
system in the audit log, if we were to "namespace" the audit container
ID such that the value was no longer guaranteed to be unique
throughout the system, we would need to additionally track the audit
namespace along with the audit container ID which starts to border on
insanity IMHO.

> If we can't trust ns_capable() then why are we passing on
> CAP_AUDIT_CONTROL?  It is being passed down and not stripped purposely
> by the orchestrator/engine.  If ns_capable() isn't inherited how is it
> gained otherwise?  Can it be inserted by cotainer image?  I think the
> answer is "no".  Either we trust ns_capable() or we have audit
> namespaces (recommend based on user namespace) (or both).

My thinking is that since ns_capable() checks the credentials with
respect to the current user namespace we can't rely on it to control
access since it would be possible for a privileged process running
inside an unprivileged container to manipulate the audit container ID
(containerized process has CAP_AUDIT_CONTROL, e.g. running as root in
the container, while the container itself does not).

> At this point I would say we are at an impasse unless we trust
> ns_capable() or we implement audit namespaces.

I'm not sure how we can trust ns_capable(), but if you can think of a
way I would love to hear it.  I'm also not sure how namespacing audit
is helpful (see my above comments), but if you think it is please
explain.

> I don't think another mechanism to trust nested orchestrators/engines
> will buy us anything.
>
> Am I missing something?

Based on your questions/comments above it looks like your
understanding of ns_capable() does not match mine; if I'm thinking
about ns_capable() incorrectly, please educate me.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
