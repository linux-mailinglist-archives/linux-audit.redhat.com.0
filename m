Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E443910F686
	for <lists+linux-audit@lfdr.de>; Tue,  3 Dec 2019 05:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575349077;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mkn8DNLNZUzA6fra+6BQ7upqtcJFYzpKahAnWN0Cyqw=;
	b=egXLFYjrpkAPWi6fLTgKbRtVHaWv+o4PK3k9jRARf5FgYS6AQx9Ktbmgy8dDDEWHKj5tgY
	0qNbZg/e8kGgT5GAcWELQIf/WC+n3QvdW5BI4+u8zao0+2YU3pzwHxYrknzNlDHlrqYeky
	Bu6WmfCRxD1Zpo9gh64agl8WqZW87BY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-WI0fkvwwNlSqViYgal5tww-1; Mon, 02 Dec 2019 23:57:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0C1BDB20;
	Tue,  3 Dec 2019 04:57:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F19119C68;
	Tue,  3 Dec 2019 04:57:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26CCF18089CD;
	Tue,  3 Dec 2019 04:57:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB34vRc0018098 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 23:57:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B0655C578; Tue,  3 Dec 2019 04:57:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-104.phx2.redhat.com [10.3.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA29D5C3FD;
	Tue,  3 Dec 2019 04:57:23 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC] bpf: Emit audit messages upon successful prog load and
	unload
Date: Mon, 02 Dec 2019 23:57:22 -0500
Message-ID: <1915471.OmxkCOUsnW@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQ7zkXdz1V5hQ8PN68-NnCn56TjKA0wCL6ZjHy9Up8fuQ@mail.gmail.com>
References: <20191128091633.29275-1-jolsa@kernel.org>
	<CAHC9VhQ7zkXdz1V5hQ8PN68-NnCn56TjKA0wCL6ZjHy9Up8fuQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: WI0fkvwwNlSqViYgal5tww-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, December 2, 2019 6:00:14 PM EST Paul Moore wrote:
> On Thu, Nov 28, 2019 at 4:16 AM Jiri Olsa <jolsa@kernel.org> wrote:
> > From: Daniel Borkmann <daniel@iogearbox.net>
> > 
> > Allow for audit messages to be emitted upon BPF program load and
> > unload for having a timeline of events. The load itself is in
> > syscall context, so additional info about the process initiating
> > the BPF prog creation can be logged and later directly correlated
> > to the unload event.
> > 
> > The only info really needed from BPF side is the globally unique
> > prog ID where then audit user space tooling can query / dump all
> > info needed about the specific BPF program right upon load event
> > and enrich the record, thus these changes needed here can be kept
> > small and non-intrusive to the core.
> > 
> > Raw example output:
> >   # auditctl -D
> >   # auditctl -a always,exit -F arch=x86_64 -S bpf
> >   # ausearch --start recent -m 1334
> >   ...
> >   ----
> >   time->Wed Nov 27 16:04:13 2019
> >   type=PROCTITLE msg=audit(1574867053.120:84664): proctitle="./bpf"
> >   type=SYSCALL msg=audit(1574867053.120:84664): arch=c000003e syscall=321
> >     \>   
> >     success=yes exit=3 a0=5 a1=7ffea484fbe0 a2=70 a3=0 items=0 ppid=7477 
> >       \
> >     pid=12698 auid=1001 uid=1001 gid=1001 euid=1001 suid=1001 fsuid=1001 
> >       \
> >     egid=1001 sgid=1001 fsgid=1001 tty=pts2 ses=4 comm="bpf"             
> >       \
> >     exe="/home/jolsa/auditd/audit-testsuite/tests/bpf/bpf"               
> >       \
> >     subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> >   
> >   type=UNKNOWN[1334] msg=audit(1574867053.120:84664): prog-id=76 op=LOAD
> >   ----
> >   time->Wed Nov 27 16:04:13 2019
> >   type=UNKNOWN[1334] msg=audit(1574867053.120:84665): prog-id=76
> >   op=UNLOAD
> >   ...
> > 
> > Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> > Co-developed-by: Jiri Olsa <jolsa@kernel.org>
> > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > ---
> > 
> >  include/uapi/linux/audit.h |  1 +
> >  kernel/bpf/syscall.c       | 27 +++++++++++++++++++++++++++
> >  2 files changed, 28 insertions(+)
> 
> Hi all, sorry for the delay; the merge window in combination with the
> holiday in the US bumped this back a bit.  Small comments inline below
> ...
> 
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> > @@ -23,6 +23,7 @@
> > 
> >  #include <linux/timekeeping.h>
> >  #include <linux/ctype.h>
> >  #include <linux/nospec.h>
> > 
> > +#include <linux/audit.h>
> > 
> >  #include <uapi/linux/btf.h>
> >  
> >  #define IS_FD_ARRAY(map) ((map)->map_type ==
> >  BPF_MAP_TYPE_PERF_EVENT_ARRAY || \> 
> > @@ -1306,6 +1307,30 @@ static int find_prog_type(enum bpf_prog_type type,
> > struct bpf_prog *prog)> 
> >         return 0;
> >  
> >  }
> > 
> > +enum bpf_audit {
> > +       BPF_AUDIT_LOAD,
> > +       BPF_AUDIT_UNLOAD,
> > +};
> > +
> > +static const char * const bpf_audit_str[] = {
> > +       [BPF_AUDIT_LOAD]   = "LOAD",
> > +       [BPF_AUDIT_UNLOAD] = "UNLOAD",
> > +};
> > +
> > +static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_audit
> > op) +{
> > +       struct audit_buffer *ab;
> > +
> > +       if (audit_enabled == AUDIT_OFF)
> > +               return;
> 
> I think you would probably also want to check the results of
> audit_dummy_context() here as well, see all the various audit_XXX()
> functions in include/linux/audit.h as an example.  You'll see a
> pattern similar to the following:
> 
> static inline void audit_foo(...)
> {
>   if (unlikely(!audit_dummy_context()))
>     __audit_foo(...)
> }
> 
> > +       ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_BPF);
> > +       if (unlikely(!ab))
> > +               return;
> > +       audit_log_format(ab, "prog-id=%u op=%s",
> > +                        prog->aux->id, bpf_audit_str[op]);
> 
> Is it worth putting some checks in here to make sure that you don't
> blow past the end of the bpf_audit_str array?

I am wondering if prog-id was really the only information that was needed? Is 
it meaningful to other tools? Does that correlate to anything in /proc? In 
earlier discussion, it sounded like more information was needed to be sure 
what was happening.

-Steve


> > +       audit_log_end(ab);
> > +}
> 
> The audit record format looks much better now, thank you.  Although I
> do wonder if you want bpf_audit_prog() to live in kernel/bpf/syscall.c
> or in kernel/auditsc.c?  There is plenty of precedence for moving it
> into auditsc.c and defining a no-op version for when
> CONFIG_AUDITSYSCALL is not enabled, but I personally don't feel that
> strongly about either option.  I just wanted to mention this in case
> you weren't already aware.
> 
> If you do keep it in syscall.c, I don't think there is a need to
> implement a no-op version dependent on CONFIG_AUDITSYSCALL; that will
> just clutter the code.
> 
> If you do move it to auditsc.c please change the name to
> audit_bpf()/__audit_bpf() so it matches the other functions; if you
> keep it in syscall.c you can name it whatever you like :)
> 
> --
> paul moore
> www.paul-moore.com




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

