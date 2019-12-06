Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 38AA41158A5
	for <lists+linux-audit@lfdr.de>; Fri,  6 Dec 2019 22:30:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575667835;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yb1ubvKhlZwCurHZNH79p2FUFlyikVyjvovNxRCALXI=;
	b=g63rrJ5P5P5vGZKKELOC6Su4Vwev70RYHFdKhRn9irb4k+lIImSvKVPag2F2zf3URepuiz
	qp2loZ4BqJjX4zN7o9MvektEzhKpX3tDn7g1RGgAoOglrVbIsnjMprmxqaOqrvsfuS0PAo
	wPkRQM07OER+w1AKTcc3LlhC4WtnKww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-OHFIH2iEPX-Al_ao9rBO9g-1; Fri, 06 Dec 2019 16:30:34 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB3C2183B700;
	Fri,  6 Dec 2019 21:30:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3482B5C1D6;
	Fri,  6 Dec 2019 21:30:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C02A1809567;
	Fri,  6 Dec 2019 21:30:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB6LRtXP014137 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 16:27:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 404315C219; Fri,  6 Dec 2019 21:27:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (ovpn-204-89.brq.redhat.com [10.40.204.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50E405C1D4;
	Fri,  6 Dec 2019 21:27:49 +0000 (UTC)
Date: Fri, 6 Dec 2019 22:27:46 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCHv2] bpf: Emit audit messages upon successful prog load and
	unload
Message-ID: <20191206212746.GA30691@krava>
References: <20191205102552.19407-1-jolsa@kernel.org>
	<CAHC9VhTWnNvfMAPz-WhD9Wqv6UZZDBdMxF9VuS3UeTLHLtfhHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTWnNvfMAPz-WhD9Wqv6UZZDBdMxF9VuS3UeTLHLtfhHw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 06 Dec 2019 16:30:18 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: OHFIH2iEPX-Al_ao9rBO9g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Dec 06, 2019 at 04:11:13PM -0500, Paul Moore wrote:

SNIP

> >
> >  #define IS_FD_ARRAY(map) ((map)->map_type == BPF_MAP_TYPE_PERF_EVENT_ARRAY || \
> > @@ -1306,6 +1307,36 @@ static int find_prog_type(enum bpf_prog_type type, struct bpf_prog *prog)
> >         return 0;
> >  }
> >
> > +enum bpf_audit {
> > +       BPF_AUDIT_LOAD,
> > +       BPF_AUDIT_UNLOAD,
> > +       BPF_AUDIT_MAX,
> > +};
> > +
> > +static const char * const bpf_audit_str[BPF_AUDIT_MAX] = {
> > +       [BPF_AUDIT_LOAD]   = "LOAD",
> > +       [BPF_AUDIT_UNLOAD] = "UNLOAD",
> > +};
> > +
> > +static void bpf_audit_prog(const struct bpf_prog *prog, unsigned int op)
> > +{
> > +       struct audit_context *ctx = NULL;
> > +       struct audit_buffer *ab;
> > +
> > +       if (audit_enabled == AUDIT_OFF)
> > +               return;
> > +       if (WARN_ON_ONCE(op >= BPF_AUDIT_MAX))
> > +               return;
> 
> I feel bad saying this given the number of revisions we are at with
> this patch, but since we aren't even at -rc1 yet (although it will be
> here soon), I'm going to mention it anyway ;)
> 
> ... if we move the "op >= BPF_AUDIT_MAX" above the audit_enabled check
> we will catch problems sooner in development, which is a very good
> thing as far as I'm concerned.

sure, np will post v3

> 
> Other than that, this looks good to me, and I see Steve has already
> given the userspace portion a thumbs-up.  Have you started on the
> audit-testsuite test for this yet?

yep, it's ready.. waiting for kernel change ;-)
https://github.com/olsajiri/audit-testsuite/commit/16888ea7f14fa0269feef623d2a96f15f9ea71c9

jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

