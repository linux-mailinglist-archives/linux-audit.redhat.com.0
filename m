Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 658BE1121A4
	for <lists+linux-audit@lfdr.de>; Wed,  4 Dec 2019 03:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575428062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j8ospNeXycMWB2QkxtKB+A10hJ5WcUu0sQg/kDQLmnE=;
	b=KCjDB0sXas0XIamVPR1EBaSIi9Sx1/zWCzOHeUjYnnbU93bqwQeyYTq4UyccHJG+gI0nGo
	0ENcvqXyuUh1Fh7LW5e2xFxkzCoYmd+8aUDK0uF4/82sxR/0+DK46ExP4hRPUy7gO1HL/F
	TOZI+PJweoA1X+sYxLCQWwvc4xb5OQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-YmqSXhYRPF-R9s4E4dfhzQ-1; Tue, 03 Dec 2019 21:54:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41CB8107ACC4;
	Wed,  4 Dec 2019 02:54:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3265D1001925;
	Wed,  4 Dec 2019 02:54:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CED9E5B41F;
	Wed,  4 Dec 2019 02:54:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB42rXXf005843 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 21:53:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 71B09104135A; Wed,  4 Dec 2019 02:53:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7FF1041359
	for <linux-audit@redhat.com>; Wed,  4 Dec 2019 02:53:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 891C3906E28
	for <linux-audit@redhat.com>; Wed,  4 Dec 2019 02:53:31 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-277-P4o2STB4NIOCVbrrLWAUyw-1; Tue, 03 Dec 2019 21:53:29 -0500
Received: by mail-lf1-f42.google.com with SMTP id 9so3331444lfq.10
	for <linux-audit@redhat.com>; Tue, 03 Dec 2019 18:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uR+pT65soPzjqJ67S48glzTfhGJEKMDDLWprJm5r4mY=;
	b=V5lgUmbXz6rvGJ+l2y8ESxxdflfgbFxTZ9M/MsSmcunTLDaKbiky+dQg8yjQZg/vSG
	z4R5ZXAe954NUqy3Wmc1ebwrDiO8NF9cOnz2Zkz50Vq+HQmBCznhvOmWL/VEnrS8VW45
	8W+8av1pK8NWsSHCC6Ym5t4WOTHdm6T8kVbjW4c7GWRmVCbDzuND6afRH/u85neEWSuI
	9iFWl0PgTqaG61x3Gf0zg1T7Iinp8wmFBn4UyxkXxnmHAZkIjYTN1NdyteDX4weYEJVa
	XFkwO1uJ5Qnpe3dWjmdk6zTxfipB1Hk7fW4No+/Uokv/Z7pOYg8CugSm/XFKPPm9t1HS
	Uo3Q==
X-Gm-Message-State: APjAAAXp/zAJHSszv/ExEgLmV7+WwesYK3sTbdxnSYNQ432jw4N54Gt+
	gDPvlx/MEGyuaAEFXzUAh+9yhrHv4+hNtD+Ifp6H
X-Google-Smtp-Source: APXvYqxC2jCV69k21E2WvCNty27MXD7mqixisctmZLTFJfdlz1LwQeP4SH3ptOANsNEsWPDaO4sPYI3Qqt1vdi3PFGA=
X-Received: by 2002:ac2:424d:: with SMTP id m13mr619905lfl.13.1575428007737;
	Tue, 03 Dec 2019 18:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20191128091633.29275-1-jolsa@kernel.org>
	<CAHC9VhQ7zkXdz1V5hQ8PN68-NnCn56TjKA0wCL6ZjHy9Up8fuQ@mail.gmail.com>
	<20191203093837.GC17468@krava>
In-Reply-To: <20191203093837.GC17468@krava>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Dec 2019 21:53:16 -0500
Message-ID: <CAHC9VhRhMhsRPj1D2TY3O=Nc6Rx9=o1-Z5ZMjrCepfFY6VtdbQ@mail.gmail.com>
Subject: Re: [RFC] bpf: Emit audit messages upon successful prog load and
	unload
To: Jiri Olsa <jolsa@redhat.com>
X-MC-Unique: P4o2STB4NIOCVbrrLWAUyw-1
X-MC-Unique: YmqSXhYRPF-R9s4E4dfhzQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB42rXXf005843
X-loop: linux-audit@redhat.com
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
	Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 3, 2019 at 4:38 AM Jiri Olsa <jolsa@redhat.com> wrote:
> On Mon, Dec 02, 2019 at 06:00:14PM -0500, Paul Moore wrote:
> > On Thu, Nov 28, 2019 at 4:16 AM Jiri Olsa <jolsa@kernel.org> wrote:

...

> > > --- a/kernel/bpf/syscall.c
> > > +++ b/kernel/bpf/syscall.c
> > > @@ -23,6 +23,7 @@
> > >  #include <linux/timekeeping.h>
> > >  #include <linux/ctype.h>
> > >  #include <linux/nospec.h>
> > > +#include <linux/audit.h>
> > >  #include <uapi/linux/btf.h>
> > >
> > >  #define IS_FD_ARRAY(map) ((map)->map_type == BPF_MAP_TYPE_PERF_EVENT_ARRAY || \
> > > @@ -1306,6 +1307,30 @@ static int find_prog_type(enum bpf_prog_type type, struct bpf_prog *prog)
> > >         return 0;
> > >  }
> > >
> > > +enum bpf_audit {
> > > +       BPF_AUDIT_LOAD,
> > > +       BPF_AUDIT_UNLOAD,
> > > +};
> > > +
> > > +static const char * const bpf_audit_str[] = {
> > > +       [BPF_AUDIT_LOAD]   = "LOAD",
> > > +       [BPF_AUDIT_UNLOAD] = "UNLOAD",
> > > +};
> > > +
> > > +static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_audit op)
> > > +{
> > > +       struct audit_buffer *ab;
> > > +
> > > +       if (audit_enabled == AUDIT_OFF)
> > > +               return;
> >
> > I think you would probably also want to check the results of
> > audit_dummy_context() here as well, see all the various audit_XXX()
> > functions in include/linux/audit.h as an example.  You'll see a
> > pattern similar to the following:
> >
> > static inline void audit_foo(...)
> > {
> >   if (unlikely(!audit_dummy_context()))
> >     __audit_foo(...)
> > }
>
> bpf_audit_prog might be called outside of syscall context for UNLOAD event,
> so that would prevent it from being stored

Okay, right.  More on this below ...

> I can see audit_log_start checks on value of audit_context() that we pass in,

The check in audit_log_start() is for a different reason; it checks
the passed context to see if it should associate the record with
others in the same event, e.g. PATH records associated with the
matching SYSCALL record.  This way all the associated records show up
as part of the same event (as defined by the audit timestamp).

> should we check for audit_dummy_context just for load event? like:
>
>
> static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_audit op)
> {
>         struct audit_buffer *ab;
>
>         if (audit_enabled == AUDIT_OFF)
>                 return;
>         if (op == BPF_AUDIT_LOAD && audit_dummy_context())
>                 return;
>         ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_BPF);
>         if (unlikely(!ab))
>                 return;
>         ...
> }

Ignoring the dummy context for a minute, there is likely a larger
issue here with using audit_context() when bpf_audit_prog() is called
outside of a syscall, e.g. BPF_AUDIT_UNLOAD.  In this case we likely
shouldn't be taking the audit context from the current task, we
shouldn't be taking it from anywhere, it should be NULL.

As far as the dummy context is concerned, you might want to skip the
dummy context check since you can only do that on the LOAD side, which
means that depending on the system's configuration you could end up
with a number of unbalanced LOAD/UNLOAD events.  The downside is that
you are always going to get the BPF audit records on systemd based
systems, since they ignore the admin's audit configuration and always
enable audit (yes, we've tried to get systemd to change, they don't
seem to care).

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

