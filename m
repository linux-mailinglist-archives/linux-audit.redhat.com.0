Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D122811000A
	for <lists+linux-audit@lfdr.de>; Tue,  3 Dec 2019 15:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575382852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5/DXvsa+z8WtZQ472s9QRe+haiZrnG5E90ClEPac3zo=;
	b=h1mdfEdMqtmmTp0m0e9EbeXyymZ55fpZ5mmtp8Xk9FJWUZu88TgZHY77C+4GCxzorus+30
	asehD/uYHxtQSlpgtxF+REKbvNTX/z/SMxanUoUjBSIPLHSgiP/QTSlXNKDgXv1U0VUy9F
	cn9KbI+QoaFcw1iOnGKnR3N3MMB+/Rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-i8C5WG0EMFG52dXuSl99Vg-1; Tue, 03 Dec 2019 09:20:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 356E6800D4C;
	Tue,  3 Dec 2019 14:20:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81A58A4B60;
	Tue,  3 Dec 2019 14:20:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB02818089CD;
	Tue,  3 Dec 2019 14:20:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB38kXub031894 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 03:46:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4E37469181; Tue,  3 Dec 2019 08:46:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.48])
	by smtp.corp.redhat.com (Postfix) with SMTP id D89B667E58;
	Tue,  3 Dec 2019 08:46:27 +0000 (UTC)
Date: Tue, 3 Dec 2019 09:46:26 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [RFC] bpf: Emit audit messages upon successful prog load and
	unload
Message-ID: <20191203084626.GB17468@krava>
References: <20191128091633.29275-1-jolsa@kernel.org>
	<CAHC9VhQ7zkXdz1V5hQ8PN68-NnCn56TjKA0wCL6ZjHy9Up8fuQ@mail.gmail.com>
	<1915471.OmxkCOUsnW@x2>
MIME-Version: 1.0
In-Reply-To: <1915471.OmxkCOUsnW@x2>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 03 Dec 2019 09:20:34 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: i8C5WG0EMFG52dXuSl99Vg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 02, 2019 at 11:57:22PM -0500, Steve Grubb wrote:
> On Monday, December 2, 2019 6:00:14 PM EST Paul Moore wrote:
> > On Thu, Nov 28, 2019 at 4:16 AM Jiri Olsa <jolsa@kernel.org> wrote:
> > > From: Daniel Borkmann <daniel@iogearbox.net>
> > > 
> > > Allow for audit messages to be emitted upon BPF program load and
> > > unload for having a timeline of events. The load itself is in
> > > syscall context, so additional info about the process initiating
> > > the BPF prog creation can be logged and later directly correlated
> > > to the unload event.
> > > 
> > > The only info really needed from BPF side is the globally unique
> > > prog ID where then audit user space tooling can query / dump all
> > > info needed about the specific BPF program right upon load event
> > > and enrich the record, thus these changes needed here can be kept
> > > small and non-intrusive to the core.

SNIP

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
> > 
> > > +       ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_BPF);
> > > +       if (unlikely(!ab))
> > > +               return;
> > > +       audit_log_format(ab, "prog-id=%u op=%s",
> > > +                        prog->aux->id, bpf_audit_str[op]);
> > 
> > Is it worth putting some checks in here to make sure that you don't
> > blow past the end of the bpf_audit_str array?
> 
> I am wondering if prog-id was really the only information that was needed? Is 
> it meaningful to other tools? Does that correlate to anything in /proc? In 
> earlier discussion, it sounded like more information was needed to be sure 
> what was happening.

yep, as David mentions in the changelog the global ID is enough,
because you can get all the other bpf program info based on that

jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

